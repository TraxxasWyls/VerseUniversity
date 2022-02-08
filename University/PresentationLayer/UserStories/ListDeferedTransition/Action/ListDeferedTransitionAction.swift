//
//  ListDeferedTransitionAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - ListDeferedTransitionAction

public enum ListDeferedTransitionAction: Equatable {
    case loadingCompleted(id: UUID)
    case counter(CounterAction)
    case setNavigation(id: UUID?)
}
