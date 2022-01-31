//
//  MegaCounterReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation
import VERSE

// MARK: - Aliases

public typealias MegaCounterReducer = Reducer<MegaCounterState, MegaCounterAction, MegaCounterEnvironment>

// MARK: - MegaReducer

public let megaCounterReducer = MegaCounterReducer.combine(
    analyzableCounterReducer
        .optional()
        .pullback(
            state: \MegaCounterState.analyzableCounterState,
            action: /MegaCounterAction.analyzableCounter,
            environment: AnalyzableCounterEnvironment()
        ),
    fibonacciCounterReducer
        .optional()
        .pullback(
            state: \MegaCounterState.fibonacciCounterState,
            action: /MegaCounterAction.fibonacciCounter,
            environment: FibonacciCounterEnvironment()
        ),
    .init { state, action, environment in
        switch action {
        case .toggleOptionalFibonacci:
            state.fibonacciCounterState = state.fibonacciCounterState == nil ? FibonacciCounterState() : nil
            return .none
        case .toggleOptionalAnalyzable:
            state.analyzableCounterState = state.analyzableCounterState == nil ? AnalyzableCounterState() : nil
            return .none
        default:
            return .none
        }
    }
)
