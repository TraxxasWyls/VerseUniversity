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
        state: \.counterState,
        action: /AnalyzableCounterAction.counter,
        environment: CounterEnvironment()
    ),
    AnalyzableCounterReducer { state, action, environment in
        state.maxValue = max(state.counterState.count, state.maxValue)
        state.minValue = min(state.counterState.count, state.minValue)
        state.eventsCount = state.eventsCount + 1
        return .none
    }
)
