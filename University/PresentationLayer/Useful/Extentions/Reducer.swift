//
//  Reducer.swift
//  University
//
//  Created by Дмитрий Савинов on 09.02.2022.
//

import Foundation
import VERSE
import SwiftUI

// MARK: - Reducer

public extension Reducer {

    static func recursive(
        _ reducer: @escaping(Reducer, inout State, Action, Environment) -> Effect<Action, Never>
    ) -> Reducer {
        var recursiveReducer: Reducer!
        recursiveReducer = .init { state, action, environment in
            reducer(recursiveReducer, &state, action, environment)
        }
        return recursiveReducer
    }
}
