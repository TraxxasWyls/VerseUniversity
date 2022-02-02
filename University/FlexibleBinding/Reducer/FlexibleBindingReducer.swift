//
//  FlexibleBindingReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import VERSE

// MARK: - FlexibleBindingReducer

public typealias FlexibleBindingReducer = Reducer<FlexibleBindingState, FlexibleBindingAction, FlexibleBindingEnvironment>

public let flexibleBindingReducer = FlexibleBindingReducer.combine(
    counterReducer.pullback(
        state: \.counter,
        action: /FlexibleBindingAction.counter,
        environment: CounterEnvironment()
    ),
    .init { state, action, environment in
        switch action {
        case .controlReseted:
            state = FlexibleBindingState()
        case .counter(.decrementButtonTapped):
            state.sliderValue = Double(min(state.counter.count, Int(state.sliderValue)))
        default:
            break
        }
        return .none
    }
).binding()
