//
//  TimerAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - TimerAction

public enum TimerAction: Equatable {
    case timerTick
    case decrementTimerTick
    case timerButtonTapped
    case onDisappear
}
