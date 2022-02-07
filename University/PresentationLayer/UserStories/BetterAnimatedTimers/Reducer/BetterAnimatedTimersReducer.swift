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

        func timerID(byTimerCounterID timerCounterID: TimerCounterID) -> TimerID? {
            state.timerCounterItems[id: timerCounterID]?.timerState.id
        }
        func timerCounterID(byTimerID timerID: TimerID) -> TimerCounterID? {
            state.timerCounterItems.filter { $0.timerState.id == timerID }.first?.id
        }
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
        func startNextCounterTimer(byTimerID timerID: TimerID) -> Effect<BetterAnimatedTimersAction, Never>? {
            let timerPosition = state.timerItemsIds.firstIndex(of: timerID) ?? 0
            let nextTimerID: TimerID? = timerPosition < state.timerItemsIds.count - 1 ?
            state.timerItemsIds[timerPosition + 1] : nil
            guard let nextTimerID = nextTimerID,
                  let nextCounterTimerID = timerCounterID(byTimerID: nextTimerID)
            else { return nil }
            if state.timerCounterItems[id: nextCounterTimerID]?.timerState.isDisplayed == true {
                return .init(value: .timerCounterItem(id: nextCounterTimerID, action: .timer(.timerButtonTapped)))
            }
            return nil
        }

        switch action {
        case let .timerItem(id: id, action: .timerButtonTapped):
            if state.timerItems[id: id]?.progress == 1, !state.allTimersDone {
                state.timerItems[id: id]?.isTimerActive = true
            }
        case let .timerCounterItem(id: id, action: .timer(.onAppear)):
            state.appearedTimerCounterIds.contains(id)
            if let timerID = timerID(byTimerCounterID: id),
               let timerState = state.timerItems[id: timerID] {
                state.timerCounterItems[id: id]?.timerState = timerState
                state.timerCounterItems[id: id]?.timerState.shoudCancelOnDissappear = true
                return buttonTapNextTimerIfNeeded(timerID: timerID)
            }
        case let .timerCounterItem(id: id, action: .timer(.onDisappear)):
            if let timerID = timerID(byTimerCounterID: id),
               let timerCounterState = state.timerCounterItems[id: id]?.timerState {
                state.timerItems[id: timerID] = timerCounterState
                state.timerItems[id: timerID]?.shoudCancelOnDissappear = false
                return buttonTapNextTimerIfNeeded(timerID: timerID)
            }
        case let .timerItem(id: id, action: .timerHasBeenEnded):
            timerHasBeenEnded(timerID: id)
            if state.timerMode == .consecutive {
                if let startNextCounterTimer = startNextCounterTimer(byTimerID: id) {
                    return startNextCounterTimer
                }
                return startNextInConcsecutive()
            }
        case let .timerCounterItem(id: id, action: .timer(.timerHasBeenEnded)):
            if let timerID = timerID(byTimerCounterID: id) {
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
    timerCounterReducer.forEach(
        state: \.timerCounterItems,
        action: /BetterAnimatedTimersAction.timerCounterItem(id:action:),
        environment: { _ in .init() }
    )
)
