//
//  TimerReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

typealias TimerReducer = Reducer<TimerState, TimerAction, TimerEnvironment>

let timerReducer = TimerReducer.init{ state, action, environment in
    switch action {
    case .timerButtonTapped:
        if state.progress == state.progressMaxValue && !state.isTimerActive {
            state.progress = 0
        }
        state.isTimerActive.toggle()
        return .when(
            state.isTimerActive,
            then: Effect.timer(
                id: state.id,
                every: DispatchQueue.SchedulerTimeType.Stride(floatLiteral: state.stepInterval),
                on: DispatchQueue.main.eraseToAnyScheduler()
            ).map { _ in TimerAction.timerTick },
            else: .cancel(id: state.id)
        )
    case .timerTick:
        if state.progress + state.step >= state.progressMaxValue {
            state.progress = state.progressMaxValue
            return .init(value: .timerHasBeenEnded)
        } else {
            state.progress += state.step
        }
        state.progress = min(state.progress, state.progressMaxValue)
    case .timerHasBeenEnded:
        state.isTimerActive = false
        return Effect.cancel(id: state.id)
    case .onDisappear:
        if state.shoudCancelOnDissappear {
            state.progress = 0
            return Effect.cancel(id: state.id)
        }
    case .onAppear:
        if state.isTimerActive {
            state.isTimerActive = false
            return .init(value: .timerButtonTapped)
        }
    }
    return .none
}
