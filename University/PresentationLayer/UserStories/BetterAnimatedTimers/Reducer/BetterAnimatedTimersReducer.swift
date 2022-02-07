//
//  BetterAnimatedTimersReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

typealias BetterAnimatedTimersReducer = Reducer<BetterAnimatedTimersState, BetterAnimatedTimersAction, BetterAnimatedTimersEnvironment>

let betterAnimatedTimersReducer = BetterAnimatedTimersReducer.combine(
    .init { state, action, environment in

        func parallelTimers() -> Effect<BetterAnimatedTimersAction, Never> {
            .merge(
                state.timerItems.map { item in
                    Effect<BetterAnimatedTimersAction, Never>
                        .init(value: .timerItem(id: item.id, action: .timerButtonTapped))
                }
            )
        }
        func clearTimersProgessAndChangeActiveState() {
            state.timerItems.updateEach {
                $0.progress = 0
                $0.isTimerActive = false
            }
            state.completeTimers = .init()
        }
        func timerHasBeenEnded(timerID: TimerID) {
            state.completeTimers.insert(timerID)
            if state.completeTimers.count == state.timerItems.count {
                state.allTimersDone = true
            }
        }
        func buttonTapNextTimerIfNeeded(timerID: TimerID) -> Effect<BetterAnimatedTimersAction, Never> {
            let timerPosition = state.timerItemsIds.firstIndex(of: timerID) ?? 0
            let currentTimerContains = state.completeTimers.contains(timerID)
            let previousTimerContains: Bool = timerPosition > 0 ?
            state.completeTimers.contains(state.timerItemsIds[timerPosition - 1]) : true
            if state.isTimersOnFire == true,
               ((!currentTimerContains && previousTimerContains) || !(state.timerMode == .consecutive))  {
                return .init(value: .timerItem(id: timerID, action: .timerButtonTapped))
            }
            return .none
        }
        func startNextInConcsecutive(checkForActive: Bool = false) -> Effect<BetterAnimatedTimersAction, Never> {
            let nextTimerID = state.timerItemsIds
                .filter { !state.completeTimers.contains($0) }
                .first
            guard let nextTimerID = nextTimerID else { return .none }
            if checkForActive || state.timerItems[id: nextTimerID]?.isTimerActive == false && state.isTimersOnFire {
                return .init(value: .timerItem(id: nextTimerID, action: .timerButtonTapped))
            }
            return .none
        }

        switch action {
        case let .timerItem(id: id, action: .timerButtonTapped):
            if state.timerItems[id: id]?.progress == 1, !state.allTimersDone {
                state.timerItems[id: id]?.isTimerActive = true
            }
        case .timerCounter(.timer(.onAppear)):
            if let timerID = state.selection?.id {
                return buttonTapNextTimerIfNeeded(timerID: timerID)
            }
        case.timerCounter(.timer(.onDisappear)):
            if let timerID = state.selection?.id {
                state.timerItems[id: timerID]?.progress = state.timerCounterState.timerState.progress
                state.timerItems[id: timerID]?.isTimerActive = state.timerCounterState.timerState.isTimerActive
                return buttonTapNextTimerIfNeeded(timerID: timerID)
            }
        case let .timerItem(id: id, action: .timerHasBeenEnded):
            timerHasBeenEnded(timerID: id)
            let nextTimerID = state.timerItemsIds
                .filter { !state.completeTimers.contains($0) }
                .first
            if state.timerMode == .consecutive {
                if state.timerCounterState.timerState.isDisplayed,
                   state.isTimersOnFire,
                   state.selection?.id == nextTimerID {
                    return .init(value: .timerCounter(.timer(.timerButtonTapped)))
                }
                return startNextInConcsecutive()
            }
        case .timerCounter(.timer(.timerHasBeenEnded)):
            if let timerID = state.selection?.id, state.timerCounterState.timerState.isDisplayed {
                timerHasBeenEnded(timerID: timerID)
                if state.timerMode == .consecutive {
                    return startNextInConcsecutive()
                }
            }
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
                return startNextInConcsecutive(checkForActive: true)
            default:
                break
            }
            switch state.previousTimerMode {
            case .consecutive:
                state.timerMode = .consecutive
                state.previousTimerMode = .none
                clearTimersProgessAndChangeActiveState()
                return .init(value: .timerItem(id: state.timerItems[0].id, action: .timerButtonTapped))
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
            return .concatenate(
                .merge(parallelTimers(), parallelTimers()),
                .init(value: .timerItem(id: state.timerItems[0].id, action: .timerButtonTapped))
            )
        case .setSheet(let isSheetPresented):
            if state.allTimersDone && !isSheetPresented {
                state.allTimersDone = false
                state.isTimersOnFire = false
                state.previousTimerMode = state.timerMode
                state.timerMode = .none
                state.completeTimers = .init()
            }
        case let .setNavigation(timerID: .some(id)):
            if let selectedTimerState = state.timerItems[id: id] {
                let timerCounterState = TimerCounterState(timerState: selectedTimerState)
                state.selection = Identified(timerCounterState, id: id)
                state.timerCounterState = timerCounterState
                state.timerCounterState.timerState.shoudCancelOnDissappear = true
            }
        case .setNavigation(timerID: .none):
            state.selection = nil
            state.timerCounterState = .init()
        default:
            return .none
        }
        return .none
    },
    timerReducer.forEach(
        state: \.timerItems,
        action: /BetterAnimatedTimersAction.timerItem(id:action:),
        environment: { _ in .init() }
    ),
    timerCounterReducer
        .pullback(
        state: \.timerCounterState,
        action: /BetterAnimatedTimersAction.timerCounter,
        environment: { _ in .init() }
    )
)
