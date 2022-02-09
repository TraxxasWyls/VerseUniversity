//
//  DownloadingAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - DownloadingAction

public enum DownloadingAction: Equatable {
    case loadingCompleted(id: UUID)
    case counter(CounterAction)
    case setNavigation(id: UUID?)
}
