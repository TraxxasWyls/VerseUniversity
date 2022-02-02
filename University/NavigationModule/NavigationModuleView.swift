//
//  NavigationView.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import SwiftUI
import VERSE

// MARK: - NavigationView

public struct NavigationModuleView: View {

    // MARK: - Properties

    public let store: Store<NavigationModuleState, NavigationModuleAction>

    // MARK: - View

    public var body: some View {
        WithViewStore(store.stateless) { viewStore in
            NavigationView {
                List {
                    Section(header: Text("Beginner")) {
                        NavigationLink(
                            destination:
                                CounterView(
                                    store: store.scope(
                                        state: \.counter,
                                        action: NavigationModuleAction.counter
                                    )
                                )
                        ) {
                            Text("Counter")
                        }
                        NavigationLink(
                            destination:
                                Form {
                                    AnalyzableCounterView(
                                        store: store.scope(
                                            state: \.analyzableCounter,
                                            action: NavigationModuleAction.analyzableCounter
                                        )
                                    )
                                }
                        ) {
                            Text("Analyzable counter (composition)")
                        }
                        NavigationLink(
                            destination:
                                Form {
                                    FibonacciCounterView(
                                        store: store.scope(
                                            state: \.fibonacciCounter,
                                            action: NavigationModuleAction.fibonacciCounter
                                        )
                                    )
                                }
                        ) {
                            Text("Fibonacci counter (composition)")
                        }
                    }

                    Section(header: Text("Elementary")) {
                        NavigationLink(
                            destination:
                                MegaCounterView(
                                    store: store.scope(
                                        state: \.megaCounter,
                                        action: NavigationModuleAction.megaCounter
                                    )
                                )
                        ) {
                            Text("Optional counters")
                        }
                        NavigationLink(
                            destination:
                                AlertAndSheetView(
                                    store: store.scope(
                                        state: \.alertAndActionSheet,
                                        action: NavigationModuleAction.alertAndActionSheet
                                    )
                                )
                        ) {
                            Text("Alert and ActionSheet")
                        }
                        NavigationLink(
                            destination:
                                SimpleBindingView(
                                    store: store.scope(
                                        state: \.simpleBinding,
                                        action: NavigationModuleAction.simpleBinding
                                    )
                                )
                        ) {
                            Text("Simple Binding")
                        }
                    }
                }
                .navigationBarTitle(Text("VERSE"))
            }
        }
    }
}


struct ContentView_Preview12324: PreviewProvider {
    static var previews: some View {
        NavigationModuleView(
            store: .init(
                initialState: .init(),
                reducer: navigationModuleReducer,
                environment: NavigationModuleEnvironment()
            )
        )
    }
}
