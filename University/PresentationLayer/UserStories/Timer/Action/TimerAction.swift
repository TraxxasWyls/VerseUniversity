//
//  TimerAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - TimerAction

public enum TimerAction: Equatable {
    case onAppear
    case timerTick
    case timerButtonTapped
    case onDisappear
    case timerHasBeenEnded
}
