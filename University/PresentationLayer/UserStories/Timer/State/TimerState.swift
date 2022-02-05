//
//  TimerState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import Combine

// MARK: - TimerCancellationID

public struct TimerCancellationID: Hashable {
    public let id: UUID = UUID()
}

// MARK: - TimerState

public struct TimerState: Equatable {

    // MARK: - Properties

    public var isTimerActive = false

    public let cancellationID: TimerCancellationID = TimerCancellationID()

    public var progress: Double = 0

    public let timeInterval: TimeInterval

    public let volumeForTimeInterval: Double

    public var step: Double {
        (volumeForTimeInterval / timeInterval) * stepInterval
    }

    public let stepInterval: TimeInterval

    public let shoudCancelOnDissappear: Bool

    public let timerTheme: ProgressViewTheme

    public init(
        isTimerActive: Bool = false,
        progress: Double = 0,
        timeInterval: TimeInterval = 10,
        volumeForTimeInterval: Double = 1.0,
        stepInterval: TimeInterval = 1,
        shoudCancelOnDissappear: Bool = true,
        timerTheme: ProgressViewTheme = .init()
    ) {
        self.isTimerActive = isTimerActive
        self.progress = progress
        self.timeInterval = timeInterval
        self.volumeForTimeInterval = volumeForTimeInterval
        self.stepInterval = stepInterval
        self.shoudCancelOnDissappear = shoudCancelOnDissappear
        self.timerTheme = timerTheme
    }
}
