//
//  FlexibleBindingAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import SwiftUI
import VERSE

// MARK: - FlexibleBindingAction

public enum FlexibleBindingAction: BindableAction, Equatable {
    case binding(BindingAction<FlexibleBindingState>)
    case counter(CounterAction)
    case controlReseted
}
