//
//  TimerCounterAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - TimerCounterAction

public enum TimerCounterAction: Equatable {
    case plusButtonTapped
    case minusButtonTapped
    case generateButtonTapped
    case scrumbleResponse(Result<String, Never>)
}
