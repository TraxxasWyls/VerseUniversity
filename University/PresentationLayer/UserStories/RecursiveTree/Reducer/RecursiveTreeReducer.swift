//
//  RecursiveTreeReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

typealias RecursiveTreeReducer = Reducer<RecursiveTreeState, RecursiveTreeAction, RecursiveTreeEnvironment>

let recursiveTreeReducer = RecursiveTreeReducer.recursive{ reducer, state, action, environment in
    switch action {
    case .append:
        state.children.append(.init(name: .randomString(length: Int(arc4random()) % 10)))
    case .child:
        return reducer
            .forEach(
                state: \.children,
                action: /RecursiveTreeAction.child(id:action:),
                environment: { $0 }
            )
            . run(&state, action, environment)
    case let .remove(offset):
        state.children.remove(atOffsets: offset)
    }
    return .none
}
