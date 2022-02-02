//
//  SimpleBindingAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import SwiftUI

// MARK: - SimpleBindingAction

public enum SimpleBindingAction: Equatable {

    case disabledStateChanged(Bool)
    case counter(CounterAction)
    case sliderValueChanged(Double)
    case controlReseted
    case colorChanged(SimpleBindingState.PickableColor)
    case textChanged(String)
}
