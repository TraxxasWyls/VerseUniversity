//
//  FibonacciCounterView.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import SwiftUI
import VERSE

// MARK: - FibonacciCounterView

public struct FibonacciCounterView: View {

    // MARK: - Properties

    public let store: Store<FibonacciCounterState, FibonacciCounterAction>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
//            Form {
            Section(header: Text("Я твой Фибона че проверял")) {
                    HStack {
                        Text("Counter")
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counterState,
                                action: FibonacciCounterAction.counter
                            )
                        )
                            .buttonStyle(BorderlessButtonStyle())
                    }
                    HStack {
                        Text("Fibonacci status: ")
                        Spacer()
                        Text(viewStore.isFibonacci ? "✅" : "🛑")
                    }
                }.textCase(nil)
//            }
        }
    }
}


struct ContentView_Preview1: PreviewProvider {
    static var previews: some View {
        FibonacciCounterView(
            store: .init(
                initialState: FibonacciCounterState.init(
                    counterState: .init(count: 0),
                    isFibonacci: false
                ),
                reducer: fibonacciCounterReducer,
                environment: FibonacciCounterEnvironment()
            )
        )
    }
}
