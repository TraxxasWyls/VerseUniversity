//
//  AnalyzableCounterState.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation

// MARK: - AnalyzableCounterState

public struct AnalyzableCounterState: Equatable {

    /// Counter state
    public var counterState: CounterState = CounterState()

    /// Min value
    public var minValue: Int = 0

    /// max value
    public var maxValue: Int = 0

    /// Events count
    public var eventsCount: Int = 0
}
