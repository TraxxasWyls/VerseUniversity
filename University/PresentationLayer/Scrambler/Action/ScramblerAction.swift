//
//  ScramblerAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - ScramblerAction

public enum ScramblerAction: Equatable {
    case plusButtonTapped
    case minusButtonTapped
    case generateButtonTapped
    case scrumbleResponse(Result<String, Never>)
}
