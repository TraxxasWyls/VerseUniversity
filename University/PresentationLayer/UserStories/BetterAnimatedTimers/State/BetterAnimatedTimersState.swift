//
//  BetterAnimatedTimersState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - BetterAnimatedTimersState

public struct BetterAnimatedTimersState: Equatable {

    // MARK: - Properties

    public var isTimersOnFire = false

    public var allTimersDone = false

    public var completeTimers = Set<TimerID>()

    public var timerMode: TimerMode = .parallel

    public var previousTimerMode: TimerMode = .none

    public var selection: Identified<TimerState.ID, TimerCounterState>?

    public var timerItems: IdentifiedArrayOf<TimerState> = [
        TimerState(
            timeInterval: 2,
            volumeForTimeInterval: 1,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "9796f0"), endColor: .init(hex: "fbc7d4"))
        ),
        TimerState(
            timeInterval: 5,
            volumeForTimeInterval: 0.2,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "11998e"), endColor: .init(hex: "38ef7d"))
        ),
        TimerState(
            timeInterval: 5,
            volumeForTimeInterval: 0.4,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "ff4e50"), endColor: .init(hex: "f9d423"))
        ),
        TimerState(
            timeInterval: 2,
            volumeForTimeInterval: 10.0,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "56ccf2"), endColor: .init(hex: "2f80ed"))
        ),
        TimerState(
            timeInterval: 5,
            volumeForTimeInterval: 1,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "9796f0"), endColor: .init(hex: "fbc7d4"))
        ),
        TimerState(
            timeInterval: 5,
            volumeForTimeInterval: 0.2,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "11998e"), endColor: .init(hex: "38ef7d"))
        ),
        TimerState(
            timeInterval: 3,
            volumeForTimeInterval: 0.4,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "ff4e50"), endColor: .init(hex: "f9d423"))
        ),
        TimerState(
            timeInterval: 6,
            volumeForTimeInterval: 10.0,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "56ccf2"), endColor: .init(hex: "2f80ed"))
        ),
        TimerState(
            timeInterval: 1,
            volumeForTimeInterval: 1,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "9796f0"), endColor: .init(hex: "fbc7d4"))
        ),
        TimerState(
            timeInterval: 3,
            volumeForTimeInterval: 0.2,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "11998e"), endColor: .init(hex: "38ef7d"))
        ),
        TimerState(
            timeInterval: 8,
            volumeForTimeInterval: 0.4,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "ff4e50"), endColor: .init(hex: "f9d423"))
        ),
        TimerState(
            timeInterval: 10,
            volumeForTimeInterval: 10.0,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "56ccf2"), endColor: .init(hex: "2f80ed"))
        ),
        TimerState(
            timeInterval: 1,
            volumeForTimeInterval: 1,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "9796f0"), endColor: .init(hex: "fbc7d4"))
        ),
        TimerState(
            timeInterval: 1,
            volumeForTimeInterval: 0.2,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "11998e"), endColor: .init(hex: "38ef7d"))
        ),
        TimerState(
            timeInterval: 4,
            volumeForTimeInterval: 0.4,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "ff4e50"), endColor: .init(hex: "f9d423"))
        ),
        TimerState(
            timeInterval: 9,
            volumeForTimeInterval: 10.0,
            stepInterval: 0.125,
            shoudCancelOnDissappear: false,
            timerTheme: .init(startColor: .init(hex: "56ccf2"), endColor: .init(hex: "2f80ed"))
        )
    ]

    public var timerItemsIds: [TimerID] {
        timerItems.map(\.id)
    }

    public var timerCounterState: TimerCounterState = TimerCounterState()
}
