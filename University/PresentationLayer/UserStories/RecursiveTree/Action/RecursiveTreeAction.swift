//
//  RecursiveTreeAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - RecursiveTreeAction

public enum RecursiveTreeAction: Equatable {
    case loadingCompleted(id: UUID)
    case counter(CounterAction)
    case setNavigation(id: UUID?)
}
