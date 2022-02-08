//
//  ListInstantTransitionReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

typealias ListInstantTransitionReducer = Reducer<ListInstantTransitionState, ListInstantTransitionAction, ListInstantTransitionEnvironment>

let listInstantTransitionReducer = ListInstantTransitionReducer.combine(
    counterReducer
        .optional()
        .pullback(
            state: \Identified.value,
            action: .self,
            environment: CounterEnvironment()
        )
        .optional()
        .pullback(
            state: \ListInstantTransitionState.selection,
            action: /ListInstantTransitionAction.counter,
            environment: CounterEnvironment()
        ),
    .init { state, action, environment in
        struct ListInstantTransitionID: Hashable {}
        switch action {
        case .loadingCompleted:
            if let selection = state.selection,
               let itemCount = state.items[id: selection.id]?.count {
                state.selection?.value = .init(count: itemCount)
            }
        case let .setNavigation(id: .some(id)):
            state.selection = .init(nil, id: id)
            return Effect(value: .loadingCompleted)
                .delay(for: 1, scheduler: environment.mainQueue)
                .eraseToEffect()
                .cancellable(id: ListInstantTransitionID())
        case .setNavigation(id: .none):
            if let selection = state.selection,
               let count = selection.value?.count {
                state.items[id: selection.id]?.count = count
            }
            state.selection = nil
            return .cancel(id: ListInstantTransitionID())
        default:
            return .none
        }
        return .none
    }
)
