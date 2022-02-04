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

    public var progress: Double = 0

    public let stepInterval: TimeInterval = 1

    public let step: Double = 0.15

    public let shoudCancelOnDissappear: Bool = true

    public let timerTheme: ProgressViewTheme = .init()
}
