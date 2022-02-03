//
//  JustEffectAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - JustEffectAction

public enum JustEffectAction: Equatable {
    case randomButtonTapped
    case counter(CounterAction)
    case generateFactButtonTapped
    case cancelButtonTapped
    case numberFactResponse(Result<String, NumberFactError>)
}
