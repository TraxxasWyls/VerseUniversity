//
//  NavigationModuleState.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation

// MARK: - NavigationModuleState

public struct NavigationModuleState: Equatable {
    public var counter: CounterState = CounterState()
    public var analyzableCounter: AnalyzableCounterState = AnalyzableCounterState()
    public var fibonacciCounter: FibonacciCounterState = FibonacciCounterState()
    public var megaCounter: MegaCounterState = MegaCounterState()
}
