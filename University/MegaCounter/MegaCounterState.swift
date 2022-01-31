//
//  MegaCounterState.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation

// MARK: - MegaCounterState

public struct MegaCounterState: Equatable {

    /// Fibonacci counter state
    public var fibonacciCounterState: FibonacciCounterState? = FibonacciCounterState()

    /// Analyzable counter state
    public var analyzableCounterState: AnalyzableCounterState? = AnalyzableCounterState()

    /// Mega status
    public var statusDescription: String {
        "Так вышло, что сейчас вы" + (fibonacciCounterState == nil ? " не" : " ") + " используете счетчик чисел Фибоначчи" + ", и" + (analyzableCounterState == nil ? " не" : " ") +  " используете анализатор счетчика"
    }
}
