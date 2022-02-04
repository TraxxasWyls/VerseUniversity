//
//  SimpleBindingState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import VERSE
import SwiftUI

// MARK: - SimpleBindingState

public struct SimpleBindingState: Equatable {

    public enum PickableColor: String, CaseIterable {
        case red, green, blue, orange, purple

        var color: Color {
            switch self {
            case .red:
                return .red
            case .green:
                return .green
            case .blue:
                return .blue
            case .orange:
                return .orange
            case .purple:
                return .purple
            }
        }
    }

    var controlDisabled: Bool = false

    var counter: CounterState = CounterState()

    var sliderValue = 0.0

    var text = ""

    var pickedColor: PickableColor = .red

    let colors = PickableColor.allCases
}
