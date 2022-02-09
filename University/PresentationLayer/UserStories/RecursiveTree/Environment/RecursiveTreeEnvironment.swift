//
//  RecursiveTreeEnvironment.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - RecursiveTreeEnvironment

public struct RecursiveTreeEnvironment {

    public let scrumbleGenerator: ScrumbleGenerator = ScrumbleGeneratorImplementation()

    public let mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
}
