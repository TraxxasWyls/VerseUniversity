//
//  ListDeferedTransitionEnvironment.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - ListDeferedTransitionEnvironment

public struct ListDeferedTransitionEnvironment {

    public let scrumbleGenerator: ScrumbleGenerator = ScrumbleGeneratorImplementation()

    public let mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
}
