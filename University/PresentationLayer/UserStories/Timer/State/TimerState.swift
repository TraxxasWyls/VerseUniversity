//
//  TimerState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import Combine

// MARK: - TimerState

public struct TimerState: Equatable {

    // MARK: - Properties

    public var isTimerActive = false

    public let id: UUID = .init()

    public var progress: Double = 0

    public let progressMaxValue: Double

    public let stepInterval: TimeInterval

    public let step: Double

    public let shoudCancelOnDissappear: Bool

    public let timerTheme: ProgressViewTheme

    public init(
        isTimerActive: Bool = false,
        progress: Double = 0,
        progressMaxValue: Double = 1,
        stepInterval: TimeInterval = 1,
        step: Double = 0.15,
        shoudCancelOnDissappear: Bool = true,
        timerTheme: ProgressViewTheme = .init()
    ) {
        self.isTimerActive = isTimerActive
        self.progress = progress
        self.progressMaxValue = progressMaxValue
        self.stepInterval = stepInterval
        self.step = step
        self.shoudCancelOnDissappear = shoudCancelOnDissappear
        self.timerTheme = timerTheme
    }
}
