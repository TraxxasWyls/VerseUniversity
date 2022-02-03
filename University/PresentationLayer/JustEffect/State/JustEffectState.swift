//
//  JustEffectState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - JustEffectState

public struct JustEffectState: Equatable {

    // MARK: - Properties

    public var counterState = CounterState()

    public var isFactRequestInFlight = false

    public var numberFact: String?
}
