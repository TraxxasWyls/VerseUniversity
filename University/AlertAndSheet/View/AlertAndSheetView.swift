//
//  AlertAndSheetView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct AlertAndSheetView: View {

    let store: Store<AlertAndSheetState, AlertAndSheetAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section("Alert and Sheet") {
                    Text("Count: \(viewStore.count)")
                    Button("Alert") { viewStore.send(.alertButtonTap) }
                    .alert(store.scope(state: \.alert), dismiss: .alertDesmissed)
                    Button("Sheet") { viewStore.send(.sheetButtonTap) }
                    .actionSheet(store.scope(state: \.actionSheet), dismiss: .sheetDismissed)
                }
            }
        }
    }
}
