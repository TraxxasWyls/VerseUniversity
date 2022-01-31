//
//  NavigationModuleReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation
import VERSE

// MARK: - Aliases

public typealias NavigationModuleReducer = Reducer<NavigationModuleState, NavigationModuleAction, NavigationModuleEnvironment>

// MARK: - CounterReducer

public let navigationModuleReducer = NavigationModuleReducer { state, action, environment in
    return .none
}
