//
//  DownloadingReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

typealias DownloadingReducer = Reducer<DownloadingState, DownloadingAction, DownloadingEnvironment>

let downloadingReducer = DownloadingReducer.combine(
    counterReducer
        .optional()
        .pullback(
            state: \Identified.value,
            action: .self,
            environment: CounterEnvironment()
        )
        .optional()
        .pullback(
            state: \DownloadingState.selection,
            action: /DownloadingAction.counter,
            environment: CounterEnvironment()
        ),
    .init { state, action, environment in
        struct DownloadingID: Hashable {}
        switch action {
        case let .loadingCompleted(id):
            state.items[id: id]?.isLoading = false
            state.selection = .init(.init(count: state.items[id: id]?.count ?? 0), id: id)
        case let .setNavigation(id: .some(id)):
            for index in state.items.indices {
                state.items[index].isLoading = state.items[index].id == id
            }
            return Effect(value: .loadingCompleted(id: id))
                .delay(for: 1, scheduler: environment.mainQueue)
                .eraseToEffect()
                .cancellable(id: DownloadingID())
        case .setNavigation(id: .none):
            if let selection = state.selection,
               let count = selection.value?.count {
                state.items[id: selection.id]?.count = count
            }
            state.selection = nil
            return .cancel(id: DownloadingID())
        default:
            return .none
        }
        return .none
    }
)
