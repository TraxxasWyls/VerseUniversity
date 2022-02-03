//
//  JustEffectReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

typealias JustEffectReducer = Reducer<JustEffectState, JustEffectAction, JustEffectEnvironment>

let justEffectReducer = JustEffectReducer.combine(
    counterReducer.pullback(
        state: \.counterState,
        action: /JustEffectAction.counter,
        environment: CounterEnvironment()
    ),
    .init{ state, action, environment in

        func cancelAndGetFact() -> Effect<JustEffectAction, Never> {
            .concatenate(
                .cancel(id: NumberFactIdService()),
                .init(value: .generateFactButtonTapped)
            )
        }

        struct NumberFactIdService: Hashable {
        }
        
        switch action {
        case .randomButtonTapped:
            let randomNumber = Int(arc4random() % 100)
            state.counterState.count = randomNumber
            return cancelAndGetFact()
        case .numberFactResponse(.success(let fact)):
            state.isFactRequestInFlight = false
            state.numberFact = fact
        case .numberFactResponse(.failure(let error)):
            state.isFactRequestInFlight = false
            state.numberFact = error.localizedDescription
        case .cancelButtonTapped:
            state.isFactRequestInFlight = false
            return .cancel(id: NumberFactIdService())
        case .counter:
            guard state.isFactRequestInFlight else { return .none }
            return cancelAndGetFact()
        case .generateFactButtonTapped:
            state.isFactRequestInFlight = true
            state.numberFact = nil
            return environment
                .numberFactService
                .obtain(number: state.counterState.count)
                .receive(on: environment.mainQueue)
                .catchToEffect()
                .map(JustEffectAction.numberFactResponse)
                .cancellable(id: NumberFactIdService())
        }
        return .none
    }
)
