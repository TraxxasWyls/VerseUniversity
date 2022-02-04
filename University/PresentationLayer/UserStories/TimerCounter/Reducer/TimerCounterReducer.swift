//
//  TimerCounterReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

typealias TimerCounterReducer = Reducer<TimerCounterState, TimerCounterAction, TimerCounterEnvironment>

let timerCounterReducer = TimerCounterReducer.combine(
    timerReducer
        .pullback(
            state: \.timerState,
            action: /TimerCounterAction.timer,
            environment: TimerEnvironment()
        ),
    .init { state, action, environment in
        switch action {
        case .incrementButtonTapped:
            return .init(value: .timer(.timerTick))
        case .decrementButtonTapped:
            if state.timerState.progress <= 0 {
                state.timerState.progress = 0
            } else {
                state.timerState.progress -= state.timerState.step
            }
            state.timerState.progress = max(state.timerState.progress, 0)
        default:
            return .none
        }
        return .none
    }
)
