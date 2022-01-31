//
//  FibonacciCounterReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation
import VERSE

// MARK: - Aliases

public typealias FibonacciCounterReducer = Reducer<FibonacciCounterState, FibonacciCounterAction, FibonacciCounterEnvironment>

// MARK: - CounterReducer

public let fibonacciCounterReducer = FibonacciCounterReducer.combine(
    counterReducer.pullback(
        state: \FibonacciCounterState.counterState,
        action: /FibonacciCounterAction.counter,
        environment: CounterEnvironment()
    ),
    FibonacciCounterReducer { state, _, _ in
        state.isFibonacci = state.counterState.count.isFibonacci
        return .none
    }
)
