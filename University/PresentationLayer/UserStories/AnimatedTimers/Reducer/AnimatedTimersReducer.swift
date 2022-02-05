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
            state.completeTimers = .init()
        }
        func timerHasBeenEnded(timerIndex: Int) {
            state.completeTimers.insert(timerIndex)
            if state.completeTimers.count == 4 {
                state.allTimersDone = true
            }
        }
        func clearProgeresAfterCycle() {
            if state.allTimersDone == true {
                clearTimersProgessAndChangeActiveState()
                state.allTimersDone = false
            }
        }

        switch action {
        case .firstTimer(.timerButtonTapped):
            if state.firtstTimerState.progress == 1, !state.allTimersDone {
                state.firtstTimerState.isTimerActive = true
            }
        case .secondTimer(.timerButtonTapped):
            if state.secondTimerState.progress == 1, !state.allTimersDone {
                state.secondTimerState.isTimerActive = true
            }
        case .thirdTimer(.timerButtonTapped):
            if state.thirdTimerState.progress == 1, !state.allTimersDone {
                state.thirdTimerState.isTimerActive = true
            }
        case .fourthTimer(.timerButtonTapped):
            if state.fourthTimerState.progress == 1, !state.allTimersDone {
                state.fourthTimerState.isTimerActive = true
            }
        case .firstCounterTimer(.timer(.onAppear)):
            state.firstCounterTimerState.timerState = state.firtstTimerState
            if state.isTimersOnFire == true, (!state.completeTimers.contains(1) || !(state.timerMode == .consecutive)) {
                return .init(value: .firstTimer(.timerButtonTapped))
            }
        case .firstCounterTimer(.timer(.onDisappear)):
            state.firtstTimerState = state.firstCounterTimerState.timerState
            if state.isTimersOnFire == true, (!state.completeTimers.contains(1) || !(state.timerMode == .consecutive))  {
                return .init(value: .firstTimer(.timerButtonTapped))
            }
        case .secondCounterTimer(.timer(.onAppear)):
            state.secondCounterTimerState.timerState = state.secondTimerState
            if state.isTimersOnFire == true,
               ((!state.completeTimers.contains(2) && state.completeTimers.contains(1)) || !(state.timerMode == .consecutive))  {
                return .init(value: .secondTimer(.timerButtonTapped))
            }
        case .secondCounterTimer(.timer(.onDisappear)):
            state.secondTimerState = state.secondCounterTimerState.timerState
            if state.isTimersOnFire == true,
               ((!state.completeTimers.contains(2) && state.completeTimers.contains(1)) || !(state.timerMode == .consecutive))  {
                return .init(value: .secondTimer(.timerButtonTapped))
            }
        case .thirdCounterTimer(.timer(.onAppear)):
            state.thirdCounterTimerState.timerState = state.thirdTimerState
            if state.isTimersOnFire == true,
               ((!state.completeTimers.contains(3) && state.completeTimers.contains(2)) || !(state.timerMode == .consecutive))  {
                return .init(value: .thirdTimer(.timerButtonTapped))
            }
        case .thirdCounterTimer(.timer(.onDisappear)):
            state.thirdTimerState = state.thirdCounterTimerState.timerState
            if state.isTimersOnFire == true,
               ((!state.completeTimers.contains(3) && state.completeTimers.contains(2)) || !(state.timerMode == .consecutive))  {
                return .init(value: .thirdTimer(.timerButtonTapped))
            }
        case .fourthCounterTimer(.timer(.onAppear)):
            state.fourthCounterTimerState.timerState = state.fourthTimerState
            if state.isTimersOnFire == true,
               ((!state.completeTimers.contains(4) && state.completeTimers.contains(3)) || !(state.timerMode == .consecutive))  {
                return .init(value: .fourthTimer(.timerButtonTapped))
            }
        case .fourthCounterTimer(.timer(.onDisappear)):
            state.fourthTimerState = state.fourthCounterTimerState.timerState
            if state.isTimersOnFire == true,
               ((!state.completeTimers.contains(4) && state.completeTimers.contains(3)) || !(state.timerMode == .consecutive))  {
                return .init(value: .fourthTimer(.timerButtonTapped))
            }
        case .firstTimer(.timerHasBeenEnded), .firstCounterTimer(.timer(.timerHasBeenEnded)):
            timerHasBeenEnded(timerIndex: 1)
            if state.timerMode == .consecutive {
                if state.secondCounterTimerState.timerState.isDisplayed {
                    return .init(value: .secondCounterTimer(.timer(.timerButtonTapped)))
                }
                return .init(value: .secondTimer(.timerButtonTapped))
            }
        case .secondTimer(.timerHasBeenEnded), .secondCounterTimer(.timer(.timerHasBeenEnded)):
            timerHasBeenEnded(timerIndex: 2)
            if state.timerMode == .consecutive {
                if state.thirdCounterTimerState.timerState.isDisplayed {
                    return .init(value: .thirdCounterTimer(.timer(.timerButtonTapped)))
                }
                return .init(value: .thirdTimer(.timerButtonTapped))
            }
        case .thirdTimer(.timerHasBeenEnded), .thirdCounterTimer(.timer(.timerHasBeenEnded)):
            timerHasBeenEnded(timerIndex: 3)
            if state.timerMode == .consecutive {
                if state.fourthCounterTimerState.timerState.isDisplayed {
                    return .init(value: .fourthCounterTimer(.timer(.timerButtonTapped)))
                }
                return .init(value: .fourthTimer(.timerButtonTapped))
            }
        case .fourthTimer(.timerHasBeenEnded), .fourthCounterTimer(.timer(.timerHasBeenEnded)):
            timerHasBeenEnded(timerIndex: 4)
        case .parallelButtonTapped:
            state.isTimersOnFire = true
            state.timerMode = .parallel
            state.allTimersDone = false
            clearTimersProgessAndChangeActiveState()
            return parallelTimers()
        case .playOrPauseButtonTapped:
            state.isTimersOnFire.toggle()
            switch state.timerMode {
            case .parallel:
                return parallelTimers()
            case .consecutive:
                switch state.completeTimers.count {
                case 0: return .init(value: .firstTimer(.timerButtonTapped))
                case 1: return .init(value: .secondTimer(.timerButtonTapped))
                case 2: return .init(value: .thirdTimer(.timerButtonTapped))
                case 3: return .init(value: .fourthTimer(.timerButtonTapped))
                default: return .none
                }
            default:
                break
            }
            switch state.previousTimerMode {
            case .consecutive:
                state.timerMode = .consecutive
                state.previousTimerMode = .none
                clearTimersProgessAndChangeActiveState()
                return .init(value: .firstTimer(.timerButtonTapped))
            default:
                state.timerMode = .parallel
                state.previousTimerMode = .none
                clearTimersProgessAndChangeActiveState()
                return parallelTimers()
            }
        case .consecutiveButtonTapped:
            state.isTimersOnFire = true
            clearTimersProgessAndChangeActiveState()
            state.allTimersDone = false
            state.timerMode = .consecutive
            return .init(value: .firstTimer(.timerButtonTapped))
        case .setSheet(let isSheetPresented):
            if state.allTimersDone && !isSheetPresented {
                state.allTimersDone = false
                state.isTimersOnFire = false
                state.previousTimerMode = state.timerMode
                state.timerMode = .none
                state.completeTimers = .init()
            }
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
