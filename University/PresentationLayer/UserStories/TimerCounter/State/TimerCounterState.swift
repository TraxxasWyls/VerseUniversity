//
//  TimerCounterState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - TimerCounterState

public struct TimerCounterState: Equatable {

    // MARK: - Properties

    public var scrumble: String?

    public var isScrumbleRequestInFlight = false

    public var scrumbleLenght = 11

    public var mainText: String {
        if let scrumble = scrumble {
            return scrumble
        }
        return "Нажмите, чтобы получить скрамбл"
    }
}
