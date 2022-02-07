//
//  BetterAnimatedTimersAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - BetterAnimatedTimersAction

public enum BetterAnimatedTimersAction: Equatable {
    case timerItem(id: TimerID, action: TimerAction)
    case timerCounterItem(id: TimerCounterID, action: TimerCounterAction)
    case setNavigation(timerID: TimerID?)
    case consecutiveButtonTapped
    case playOrPauseButtonTapped
    case parallelButtonTapped
    case setSheet(Bool)
}
