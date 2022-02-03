//
//  AlertAndSheetReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

typealias AlertSheetReducer = Reducer<AlertAndSheetState, AlertAndSheetAction, AlertAndSheetEnvironment>

let alertSheetReducer = AlertSheetReducer { state, action, environment in
    switch action {
    case .alertButtonTap:
        state.alert = .init(
            title: "Alert!",
            message: "This is an alert",
            primaryButton: .cancel(),
            secondaryButton: .default("Increment", send: .incrementButtonTap)
        )
        return .none
    case .alertDesmissed:
        state.alert = nil
        return .none
    case .sheetButtonTap:
        state.actionSheet = .init(
            title: "Alert!",
            message: "This is an alert",
            buttons: [
                .cancel(),
                .default("Increment", send: .incrementButtonTap),
                .default("Decrement", send: .decrementButtonTap)
            ]
        )
        return .none
    case .sheetDismissed:
        state.actionSheet = nil
        return .none
    case .incrementButtonTap:
        state.alert = .init(title: "Incremented ⬆️")
        state.count += 1
        return .none
    case .decrementButtonTap:
        state.alert = .init(title: "Decremented ⬇️")
        state.count -= 1
        return .none
    default:
        return .none
    }
}
