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
                        NavigationLink(
                            destination:
                                FlexibleBindingView(
                                    store: store.scope(
                                        state: \.flexibleBinding,
                                        action: NavigationModuleAction.flexibleBinding
                                    )
                                )
                        ) {
                            Text("Flexible Binding")
                        }
                    }
                    Section(header: Text("Pre Entermidiate")) {
                        NavigationLink(
                            destination:
                                JustEffectView(
                                    store: store.scope(
                                        state: \.justEffect,
                                        action: NavigationModuleAction.justEffect
                                    )
                                )
                        ) {
                            Text("Just Effect")
                        }
                        NavigationLink(
                            destination:
                                ScramblerView(
                                    store: store.scope(
                                        state: \.scrambler,
                                        action: NavigationModuleAction.scrambler
                                    )
                                )
                        ) {
                            Text("Scrambler")
                        }
                    }
                    Section(header: Text("Entermidiate")) {
                        NavigationLink(
                            destination:
                                AnimatedTimersView(
                                    store: store.scope(
                                        state: \.animatedTimers,
                                        action: NavigationModuleAction.animatedTimers
                                    )
                                )
                        ) {
                            Text("Animated Timers")
                        }
                    }
                    Section(header: Text("Upper Entermidiate")) {
                        NavigationLink(
                            destination:
                                BetterAnimatedTimersView(
                                    store: store.scope(
                                        state: \.betterAnimatedTimers,
                                        action: NavigationModuleAction.betterAnimatedTimers
                                    )
                                )
                        ) {
                            Text("Better Animated Timers")
                        }
                        NavigationLink(
                            destination:
                                ListInstantTransitionView(
                                    store: store.scope(
                                        state: \.listInstantTransition,
                                        action: NavigationModuleAction.listInstantTransition
                                    )
                                )
                        ) {
                            Text("List Instant Transition")
                        }
                        NavigationLink(
                            destination:
                                ListDeferedTransitionView(
                                    store: store.scope(
                                        state: \.listDeferedTransition,
                                        action: NavigationModuleAction.listDeferedTransition
                                    )
                                )
                        ) {
                            Text("List Defered Transition")
                        }
                    }
                    Section(header: Text("Advanced")) {
                        NavigationLink(
                            destination:
                                RecursiveTreeView(
                                    store: store.scope(
                                        state: \.recursiveTree,
                                        action: NavigationModuleAction.recursiveTree
                                    )
                                )
                        ) {
                            Text("Recursive Tree")
                        }
                        NavigationLink(
                            destination:
                                DownloadingView(
                                    store: store.scope(
                                        state: \.downloading,
                                        action: NavigationModuleAction.downloading
                                    )
                                )
                        ) {
                            Text("Downloading")
                        }
                    }
                }
                .navigationBarTitle(Text("VERSE"))
            }
        }
    }
}


struct ContentView_NavigationModuleView: PreviewProvider {
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
