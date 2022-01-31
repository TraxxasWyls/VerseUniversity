//
//  ContentView.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import SwiftUI
import VERSE

// MARK: - CounterView

public struct CounterView: View {

    // MARK: - Properties

    public let store: Store<CounterState, CounterAction>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            HStack {
                Button("-") {
                    viewStore.send(.decrementButtonTapped)
                }
                Text("\(viewStore.count)")
                Button("+") {
                    viewStore.send(.incrementButtonTapped)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CounterView(
            store: .init(
                initialState: CounterState(),
                reducer: counterReducer,
                environment: CounterEnvironment()
            )
        )
    }
}
