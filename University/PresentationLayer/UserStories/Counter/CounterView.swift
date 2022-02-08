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
                Button {
                    viewStore.send(.decrementButtonTapped)
                } label: {
                    Image(systemName: "minus")
                }
                Text("\(viewStore.count)")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .monospacedDigit()
                Button {
                    viewStore.send(.incrementButtonTapped)
                } label: {
                    Image(systemName: "plus")
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
