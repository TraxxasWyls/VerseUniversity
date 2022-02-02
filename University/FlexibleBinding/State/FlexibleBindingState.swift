//
//  FlexibleBindingState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import VERSE
import SwiftUI

// MARK: - FlexibleBindingState

public struct FlexibleBindingState: Equatable, Hashable {

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

    @BindableState var controlDisabled: Bool = false

    var counter: CounterState = CounterState()

    @BindableState var sliderValue = 0.0

    @BindableState var text = ""

    @BindableState var pickedColor: PickableColor = .red

    let colors = PickableColor.allCases
}
