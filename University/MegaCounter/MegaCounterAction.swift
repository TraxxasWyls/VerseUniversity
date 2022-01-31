//
//  MegaCounterAction.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation

// MARK: - MegaCounterAction

public enum MegaCounterAction: Equatable {
    case fibonacciCounter(FibonacciCounterAction)
    case analyzableCounter(AnalyzableCounterAction)
    case toggleOptionalAnalyzable
    case toggleOptionalFibonacci
}
