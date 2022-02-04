//
//  CounterReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation
import VERSE

// MARK: - Aliases

public typealias CounterReducer = Reducer<CounterState, CounterAction, CounterEnvironment>

// MARK: - CounterReducer

public let counterReducer = CounterReducer { state, action, environment in
    switch action {
    case .incrementButtonTapped:
        state.count += 1
    case .decrementButtonTapped:
        state.count -= 1
    }
    return .none
}
