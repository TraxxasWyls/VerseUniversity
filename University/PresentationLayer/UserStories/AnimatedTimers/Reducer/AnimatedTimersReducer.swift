//
//  AnimatedTimersReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

typealias AnimatedTimersReducer = Reducer<AnimatedTimersState, AnimatedTimersAction, AnimatedTimersEnvironment>

let animatedTimersReducer = AnimatedTimersReducer.combine(
    .init { state, action, environment in

        func parallelTimers() -> Effect<AnimatedTimersAction, Never> {
            .merge(
                .init(value: .firstTimer(.timerButtonTapped)),
                .init(value: .secondTimer(.timerButtonTapped)),
                .init(value: .thirdTimer(.timerButtonTapped)),
                .init(value: .fourthTimer(.timerButtonTapped))
            )
        }
        func clearTimersProgessAndChangeActiveState() {
            state.firtstTimerState.progress = 0
            state.secondTimerState.progress = 0
            state.thirdTimerState.progress = 0
            state.fourthTimerState.progress = 0
            state.firtstTimerState.isTimerActive = false
            state.secondTimerState.isTimerActive = false
            state.thirdTimerState.isTimerActive = false
            state.fourthTimerState.isTimerActive = false
        }
        func timerHasBeenEnded() {
            state.amountOfCompleteTimers += 1
            if state.amountOfCompleteTimers == 4 {
                state.allTimersDone = true
                state.isConsecutive = false
                state.amountOfCompleteTimers = 0
            }
        }

        switch action {
        case .firstTimer(.timerButtonTapped):
            if state.firtstTimerState.progress == state.firtstTimerState.progressMaxValue, !state.allTimersDone {
                state.firtstTimerState.isTimerActive = true
            }
        case .secondTimer(.timerButtonTapped):
            if state.secondTimerState.progress == state.secondTimerState.progressMaxValue, !state.allTimersDone {
                state.secondTimerState.isTimerActive = true
            }
        case .thirdTimer(.timerButtonTapped):
            if state.thirdTimerState.progress == state.thirdTimerState.progressMaxValue, !state.allTimersDone {
                state.thirdTimerState.isTimerActive = true
            }
        case .fourthTimer(.timerButtonTapped):
            if state.fourthTimerState.progress == state.fourthTimerState.progressMaxValue, !state.allTimersDone {
                state.fourthTimerState.isTimerActive = true
            }
        case .firstCounterTimer(.timer(.onAppear)):
            state.firstCounterTimerState.timerState = state.firtstTimerState
            return .init(value: .firstTimer(.timerButtonTapped))
        case .firstCounterTimer(.timer(.onDisappear)):
            state.firtstTimerState = state.firstCounterTimerState.timerState
            return .init(value: .firstTimer(.timerButtonTapped))
        case .secondCounterTimer(.timer(.onAppear)):
            state.secondCounterTimerState.timerState = state.secondTimerState
            return .init(value: .secondTimer(.timerButtonTapped))
        case .secondCounterTimer(.timer(.onDisappear)):
            state.secondTimerState = state.secondCounterTimerState.timerState
            return .init(value: .secondTimer(.timerButtonTapped))
        case .thirdCounterTimer(.timer(.onAppear)):
            state.thirdCounterTimerState.timerState = state.thirdTimerState
            return .init(value: .thirdTimer(.timerButtonTapped))
        case .thirdCounterTimer(.timer(.onDisappear)):
            state.thirdTimerState = state.thirdCounterTimerState.timerState
            return .init(value: .thirdTimer(.timerButtonTapped))
        case .fourthCounterTimer(.timer(.onAppear)):
            state.fourthCounterTimerState.timerState = state.fourthTimerState
            return .init(value: .fourthTimer(.timerButtonTapped))
        case .fourthCounterTimer(.timer(.onDisappear)):
            state.fourthTimerState = state.fourthCounterTimerState.timerState
            return .init(value: .fourthTimer(.timerButtonTapped))
        case .firstTimer(.timerHasBeenEnded), .firstCounterTimer(.timer(.timerHasBeenEnded)):
            timerHasBeenEnded()
            if state.isConsecutive {
                return .init(value: .secondTimer(.timerButtonTapped))
            }
        case .secondTimer(.timerHasBeenEnded),.secondCounterTimer(.timer(.timerHasBeenEnded)):
            timerHasBeenEnded()
            if state.isConsecutive {
                return .init(value: .thirdTimer(.timerButtonTapped))
            }
        case .thirdTimer(.timerHasBeenEnded),  .thirdCounterTimer(.timer(.timerHasBeenEnded)):
            timerHasBeenEnded()
            if state.isConsecutive {
                return .init(value: .fourthTimer(.timerButtonTapped))
            }
        case .fourthTimer(.timerHasBeenEnded),  .fourthCounterTimer(.timer(.timerHasBeenEnded)):
            timerHasBeenEnded()
        case .parallelButtonTapped:
            state.isTimersOnFire = true
            clearTimersProgessAndChangeActiveState()
            return parallelTimers()
        case .playOrPauseButtonTapped:
            state.isTimersOnFire.toggle()
            if state.isConsecutive {
                switch state.amountOfCompleteTimers {
                case 0: return .init(value: .firstTimer(.timerButtonTapped))
                case 1: return .init(value: .secondTimer(.timerButtonTapped))
                case 2: return .init(value: .thirdTimer(.timerButtonTapped))
                case 3: return .init(value: .fourthTimer(.timerButtonTapped))
                default: return .none
                }
            } else {
                return parallelTimers()
            }
        case .consecutiveButtonTapped:
            state.isTimersOnFire = true
            clearTimersProgessAndChangeActiveState()
            state.isConsecutive = true
            return .init(value: .firstTimer(.timerButtonTapped))
        case .setSheet(let isSheetPresented):
            state.isSheetPresented = isSheetPresented
            state.allTimersDone = !isSheetPresented
        default:
            return .none
        }
        return .none
    },
    timerReducer
        .pullback(
            state: \.firtstTimerState,
            action: /AnimatedTimersAction.firstTimer,
            environment: TimerEnvironment()
        ),
    timerReducer
        .pullback(
            state: \.secondTimerState,
            action: /AnimatedTimersAction.secondTimer,
            environment: TimerEnvironment()
        ),
    timerReducer
        .pullback(
            state: \.thirdTimerState,
            action: /AnimatedTimersAction.thirdTimer,
            environment: TimerEnvironment()
        ),
    timerReducer
        .pullback(
            state: \.fourthTimerState,
            action: /AnimatedTimersAction.fourthTimer,
            environment: TimerEnvironment()
        ),
    timerCounterReducer
        .pullback(
            state: \.firstCounterTimerState,
            action: /AnimatedTimersAction.firstCounterTimer,
            environment: TimerCounterEnvironment()
        ),
    timerCounterReducer
        .pullback(
            state: \.secondCounterTimerState,
            action: /AnimatedTimersAction.secondCounterTimer,
            environment: TimerCounterEnvironment()
        ),
    timerCounterReducer
        .pullback(
            state: \.thirdCounterTimerState,
            action: /AnimatedTimersAction.thirdCounterTimer,
            environment: TimerCounterEnvironment()
        ),
    timerCounterReducer
        .pullback(
            state: \.fourthCounterTimerState,
            action: /AnimatedTimersAction.fourthCounterTimer,
            environment: TimerCounterEnvironment()
        )
).debug()
