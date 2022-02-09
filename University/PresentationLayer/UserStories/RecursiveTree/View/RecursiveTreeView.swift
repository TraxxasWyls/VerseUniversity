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
        WithViewStore(store) { viewStore in
            Form {
                ForEach(viewStore.items) { item in
                    NavigationLink(
                        tag: item.id,
                        selection: viewStore.binding(
                            get: { $0.selection?.id },
                            send: RecursiveTreeAction.setNavigation
                        )
                    ) {
                        IfLetStore(
                            store.scope(
                                state:  { $0.selection?.value },
                                action: RecursiveTreeAction.counter
                            ),
                            then: { store in
                                CounterView(store: store)
                            },
                            else: ProgressView()
                        )
                    } label: {
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(.gray)
                                    .frame(width: 25, height: 25)
                                Circle()
                                    .fill(item.color)
                                    .frame(width: 20, height: 20)
                            }
                            Text(item.title)
                            Spacer()
                            item.isLoading ? ProgressView() : nil
                            Spacer()
                            Text("\(item.count)")
                        }
                    }
                }
            }
        }.navigationBarTitle("List Instant Transition")
    }
}

struct ContentView_RecursiveTreeView: PreviewProvider {
    static var previews: some View {
        RecursiveTreeView(
            store: .init(
                initialState: RecursiveTreeState(),
                reducer: recursiveTreeReducer,
                environment: RecursiveTreeEnvironment()
            )
        )
    }
}
