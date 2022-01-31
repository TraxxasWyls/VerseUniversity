//
//  AnalyzableCounterView.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import SwiftUI
import VERSE

// MARK: - AnalyzableCounterView

public struct AnalyzableCounterView: View {

    // MARK: - Properties

    public let store: Store<AnalyzableCounterState, AnalyzableCounterAction>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
//            Form {
                Section(header: Text("Я твой счетчик анализировал")) {
                    HStack {
                        Text("Max count")
                        Spacer()
                        Text("\(viewStore.maxValue)")
                    }
                    HStack {
                        Text("Min count")
                        Spacer()
                        Text("\(viewStore.minValue)")
                    }
                    HStack {
                        Text("Events count")
                        Spacer()
                        Text("\(viewStore.eventsCount)")
                    }
                    HStack {
                        Text("Counter")
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counterState,
                                action: AnalyzableCounterAction.counter
                            )
                        )
                            .buttonStyle(BorderlessButtonStyle())
                    }
//                }.textCase(nil)
            }
        }
    }
}


struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        AnalyzableCounterView(
            store: .init(
                initialState: AnalyzableCounterState(),
                reducer: analyzableCounterReducer,
                environment: AnalyzableCounterEnvironment()
            )
        )
    }
}
