//
//  TimerReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

typealias TimerReducer = Reducer<TimerState, TimerAction, TimerEnvironment>

let timerReducer = TimerReducer.init{ state, action, environment in
    struct TimerID: Hashable {}
    switch action {
    case .timerButtonTapped:
        state.isTimerActive.toggle()
        return .when(
            state.isTimerActive,
            then: Effect.timer(
                id: TimerID(),
                every: DispatchQueue.SchedulerTimeType.Stride(floatLiteral: state.stepInterval),
                on: DispatchQueue.main.eraseToAnyScheduler()
            ).map { _ in TimerAction.timerTick },
            else: .cancel(id: TimerID())
        )
    case .timerTick:
        if state.progress >= 1 {
            state.progress = 0
        } else {
            state.progress += state.step
        }
        state.progress = min(state.progress, 1)
    case .decrementTimerTick:
        if state.progress <= 0 {
            state.progress = 0
        } else {
            state.progress -= state.step
        }
        state.progress = max(state.progress, 0)
    case .onDisappear:
        if state.shoudCancelOnDissappear {
            state.progress = 0
            return Effect.cancel(id: TimerID())
        }
    }
    return .none
}
