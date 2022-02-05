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
            if state.timerState.progress + 0.1 >= 1 {
                state.timerState.progress = 1
                return .init(value: .timer(.timerHasBeenEnded))
            } else {
                state.timerState.progress += 0.1
            }
        case .decrementButtonTapped:
            if state.timerState.progress <= 0 {
                state.timerState.progress = 0
            } else {
                state.timerState.progress -= 0.1
            }
            state.timerState.progress = max(state.timerState.progress, 0)
        default:
            return .none
        }
        return .none
    }
)
