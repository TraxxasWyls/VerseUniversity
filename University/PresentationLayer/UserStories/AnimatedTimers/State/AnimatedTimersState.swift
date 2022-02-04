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

    public var isSheetPresented = false

    public var amountOfCompleteTimers = 0

    public var isConsecutive = false

    public var firtstTimerState: TimerState = TimerState(
        progressMaxValue: 1,
        stepInterval: 0.1,
        step: 0.05882353,
        shoudCancelOnDissappear: false,
        timerTheme: .init(startColor: .init(hex: "9796f0"), endColor: .init(hex: "fbc7d4"))
    )
    public var secondTimerState: TimerState = TimerState(
        progressMaxValue: 0.2,
        stepInterval: 0.5,
        step: 0.02,
        shoudCancelOnDissappear: false,
        timerTheme: .init(startColor: .init(hex: "11998e"), endColor: .init(hex: "38ef7d"))
    )
    public var thirdTimerState: TimerState = TimerState(
        progressMaxValue: 0.1,
        stepInterval: 0.25,
        step: 0.0033333333,
        shoudCancelOnDissappear: false,
        timerTheme: .init(startColor: .init(hex: "ff4e50"), endColor: .init(hex: "f9d423"))
    )
    public var fourthTimerState: TimerState = TimerState(
        progressMaxValue: 1,
        stepInterval: 0.05,
        step: 0.004352941,
        shoudCancelOnDissappear: false,
        timerTheme: .init(startColor: .init(hex: "56ccf2"), endColor: .init(hex: "2f80ed"))
    )

    public var firstCounterTimerState = TimerCounterState()
    public var secondCounterTimerState = TimerCounterState()
    public var thirdCounterTimerState = TimerCounterState()
    public var fourthCounterTimerState = TimerCounterState()
}
