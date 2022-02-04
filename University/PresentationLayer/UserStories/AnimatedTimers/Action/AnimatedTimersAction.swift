//
//  AnimatedTimersAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - AnimatedTimersAction

public enum AnimatedTimersAction: Equatable {
    case firstTimer(TimerAction)
    case secondTimer(TimerAction)
    case thirdTimer(TimerAction)
    case fourthTimer(TimerAction)
    case firstCounterTimer(TimerCounterAction)
    case secondCounterTimer(TimerCounterAction)
    case thirdCounterTimer(TimerCounterAction)
    case fourthCounterTimer(TimerCounterAction)
    case consecutiveButtonTapped
    case playOrPauseButtonTapped
    case parallelButtonTapped
    case setSheet(Bool)
}
