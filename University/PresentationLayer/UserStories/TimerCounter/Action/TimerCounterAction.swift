//
//  TimerCounterAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - TimerCounterAction

public enum TimerCounterAction: Equatable {
    case timer(TimerAction)
    case incrementButtonTapped
    case decrementButtonTapped
}
