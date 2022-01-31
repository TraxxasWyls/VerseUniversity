//
//  FibonacciCounterState.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation

// MARK: - FibonacciCounterState

public struct FibonacciCounterState: Equatable {

    /// Counter state
    public var counterState: CounterState = CounterState()

    /// Fibonacci status
    public var isFibonacci: Bool = false

    /// Fibonacci status description
    public var fibonacciStatus: String { isFibonacci ? "✅" : "🛑" }
}
