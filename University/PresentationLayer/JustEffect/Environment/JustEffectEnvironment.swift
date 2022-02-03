//
//  JustEffectEnvironment.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - JustEffectEnvironment

public struct JustEffectEnvironment {

    public let numberFactService: NumberFactService = NumberFactServiceImplementation()

    public let mainQueue: AnySchedulerOf<DispatchQueue> = DispatchQueue.main.eraseToAnyScheduler()
}
