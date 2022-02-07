//
//  TimerCounterState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - TimerCounterID

public struct TimerCounterID: Hashable {
    public let id: UUID = UUID()
}

// MARK: - TimerCounterState

public struct TimerCounterState: Identifiable, Equatable {

    // MARK: - Properties

    public let id: TimerCounterID = TimerCounterID()

    public var timerState: TimerState = TimerState()
}
