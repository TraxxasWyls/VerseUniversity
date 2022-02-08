//
//  ListInstantTransitionAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - ListInstantTransitionAction

public enum ListInstantTransitionAction: Equatable {
    case loadingCompleted
    case counter(CounterAction)
    case setNavigation(id: UUID?)
}
