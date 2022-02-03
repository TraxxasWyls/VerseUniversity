//
//  ScramblerReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

typealias ScramblerReducer = Reducer<ScramblerState, ScramblerAction, ScramblerEnvironment>

let scramblerReducer = ScramblerReducer.init{ state, action, environment in

    func cancelAndGetScrumble() -> Effect<ScramblerAction, Never> {
        .concatenate(
            .cancel(id: ScrumbleIdGenerator()),
            .init(value: .generateButtonTapped)
        )
    }

    struct ScrumbleIdGenerator: Hashable {
    }

    switch action {
    case .minusButtonTapped:
        state.scrumbleLenght -= 1
        return cancelAndGetScrumble()
    case .plusButtonTapped:
        state.scrumbleLenght += 1
        return cancelAndGetScrumble()
    case .scrumbleResponse(.success(let scrumble)):
        state.isScrumbleRequestInFlight = false
        state.scrumble = scrumble
    case .generateButtonTapped:
        state.isScrumbleRequestInFlight = true
        state.scrumble = nil
        return environment
            .scrumbleGenerator
            .scrumble(lenght: state.scrumbleLenght)
            .receive(on: environment.mainQueue)
            .catchToEffect()
            .map(ScramblerAction.scrumbleResponse)
            .cancellable(id: ScrumbleIdGenerator())
    default:
        return .none
    }
    return .none
}
