//
//  AnalyzableCounterReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation
import VERSE

// MARK: - Aliases

public typealias AnalyzableCounterReducer = Reducer<AnalyzableCounterState, AnalyzableCounterAction, AnalyzableCounterEnvironment>

// MARK: - AnalyzableCounterReducer

public let analyzableCounterReducer = AnalyzableCounterReducer.combine(
    counterReducer.pullback(
        state: \AnalyzableCounterState.counterState,
        action: /AnalyzableCounterAction.counter,
        environment: CounterEnvironment()
    ),
    AnalyzableCounterReducer { state, action, environment in
        if state.counterState.count > state.maxValue {
            state.maxValue = state.counterState.count
        }
        else if state.counterState.count < state.minValue {
            state.minValue = state.counterState.count
        }
        state.eventsCount = state.eventsCount + 1
        return .none
    }
)
