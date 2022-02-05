//
//  AnimatedTimersState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - AnimatedTimersState

public struct AnimatedTimersState: Equatable {

    // MARK: - Properties

    public var isTimersOnFire = false

    public var allTimersDone = false

    public var completeTimers = Set<Int>()

    public var isConsecutive = false

    public var firtstTimerState: TimerState = TimerState(
        timeInterval: 17,
        volumeForTimeInterval: 1,
        stepInterval: 1,
        shoudCancelOnDissappear: false,
        timerTheme: .init(startColor: .init(hex: "9796f0"), endColor: .init(hex: "fbc7d4"))
    )
    public var secondTimerState: TimerState = TimerState(
        timeInterval: 5,
        volumeForTimeInterval: 0.2,
        stepInterval: 0.5,
        shoudCancelOnDissappear: false,
        timerTheme: .init(startColor: .init(hex: "11998e"), endColor: .init(hex: "38ef7d"))
    )
    public var thirdTimerState: TimerState = TimerState(
        timeInterval: 30,
        volumeForTimeInterval: 0.4,
        stepInterval: 0.25,
        shoudCancelOnDissappear: false,
        timerTheme: .init(startColor: .init(hex: "ff4e50"), endColor: .init(hex: "f9d423"))
    )
    public var fourthTimerState: TimerState = TimerState(
        timeInterval: 17,
        volumeForTimeInterval: 10.0,
        stepInterval: 0.125,
        shoudCancelOnDissappear: false,
        timerTheme: .init(startColor: .init(hex: "56ccf2"), endColor: .init(hex: "2f80ed"))
    )

    public var firstCounterTimerState = TimerCounterState()
    public var secondCounterTimerState = TimerCounterState()
    public var thirdCounterTimerState = TimerCounterState()
    public var fourthCounterTimerState = TimerCounterState()
}
