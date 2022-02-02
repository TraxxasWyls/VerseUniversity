//
//  SimpleBindingReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import VERSE

// MARK: - SimpleBindingReducer

public typealias SimpleBindingReducer = Reducer<SimpleBindingState, SimpleBindingAction, SimpleBindingEnvironment>

public let simpleBindingReducer = SimpleBindingReducer.combine(
    counterReducer.pullback(
        state: \.counter,
        action: /SimpleBindingAction.counter,
        environment: CounterEnvironment()
    ),
    .init { state, action, environment in
        switch action {
        case .colorChanged(let color):
            state.color = color
        case .controlReseted:
            state = SimpleBindingState()
        case .textChanged(let text):
            state.text = text
        case .sliderValueChanged(let sliderValue):
            state.sliderValue = sliderValue
        case .disabledStateChanged(let disabledState):
            state.controlDisabled = disabledState
        case .counter(.decrementButtonTapped):
            state.sliderValue = Double(min(state.counter.count, Int(state.sliderValue)))
        default:
            break
        }
        return .none
    }
).debug()
