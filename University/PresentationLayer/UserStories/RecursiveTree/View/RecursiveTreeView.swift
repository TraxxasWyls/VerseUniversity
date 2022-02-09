//
//  RecursiveTreeView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct RecursiveTreeView: View {

    let store: Store<RecursiveTreeState, RecursiveTreeAction>

    var body: some View {
        WithViewStore(store.scope(state: \.name)) { viewStore in
            Form {
                Section {
                    ForEachStore(
                        store.scope(
                            state: \.children,
                            action: RecursiveTreeAction.child(id:action:)
                        )
                    ) { childStore in
                        WithViewStore(childStore) { childViewStore in
                            HStack {
                                TextField("", text: childViewStore.binding(
                                    get: \.name,
                                    send: SimpleBindingAction.textChanged
                                ))
                                Spacer()
                                NavigationLink(destination: RecursiveTreeView(store: childStore)) {
                                    Text("")
                                }
                            }
                        }
                    }
                    .onDelete { viewStore.send(.remove($0)) }
                }.textCase(nil)
            }
            .navigationBarTitle(viewStore.state.isEmpty ? "Recursion" : viewStore.state)
            .navigationBarItems(
                trailing: Button("Add") { viewStore.send(.append) }
            )
        }
    }
}

struct ContentView_RecursiveTreeView: PreviewProvider {
    static var previews: some View {
        RecursiveTreeView(
            store: .init(
                initialState: .random(),
                reducer: recursiveTreeReducer,
                environment: RecursiveTreeEnvironment()
            )
        )
    }
}
