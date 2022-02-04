//
//  TimerCounterEnvironment.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - TimerCounterEnvironment

public struct TimerCounterEnvironment {

    public let scrumbleGenerator: ScrumbleGenerator = ScrumbleGeneratorImplementation()

    public let mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
}
