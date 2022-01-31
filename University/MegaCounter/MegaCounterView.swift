//
//  MegaCounterView.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import SwiftUI
import VERSE

// MARK: - MegaCounterView

public struct MegaCounterView: View {

    // MARK: - Properties

    public let store: Store<MegaCounterState, MegaCounterAction>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text("Мега модуль")) {
                    HStack {
                        Text(viewStore.statusDescription)
                    }
                    IfLetStore(
                        store.scope(
                            state: \.analyzableCounterState,
                            action: MegaCounterAction.analyzableCounter
                        ),
                        then: { store in
                                AnalyzableCounterView(store: store)
                                    .buttonStyle(BorderlessButtonStyle())
                        }
                    )
                    Button("Toggle analyzer") {
                        viewStore.send(.toggleOptionalAnalyzable)
                    }
                    IfLetStore(
                        store.scope(
                            state: \.fibonacciCounterState,
                            action: MegaCounterAction.fibonacciCounter
                        ),
                        then: { store in
                                FibonacciCounterView(store: store)
                                    .buttonStyle(BorderlessButtonStyle())
                        }
                    )
                    Button("Toggle fibonacci") {
                        viewStore.send(.toggleOptionalFibonacci)
                    }
                }.textCase(nil)
            }
        }
    }
}


struct ContentView_Preview12: PreviewProvider {
    static var previews: some View {
        MegaCounterView(
            store: .init(
                initialState: MegaCounterState(),
                reducer: megaCounterReducer,
                environment: MegaCounterEnvironment()
            )
        )
    }
}
