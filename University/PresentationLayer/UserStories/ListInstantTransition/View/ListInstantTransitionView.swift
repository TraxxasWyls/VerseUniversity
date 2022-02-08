//
//  ListInstantTransitionView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct ListInstantTransitionView: View {

    let store: Store<ListInstantTransitionState, ListInstantTransitionAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                ForEach(viewStore.items) { item in
                    NavigationLink(
                        tag: item.id,
                        selection: viewStore.binding(
                            get: { $0.selection?.id },
                            send: ListInstantTransitionAction.setNavigation
                        )
                    ) {
                        IfLetStore(
                            store.scope(
                                state:  { $0.selection?.value },
                                action: ListInstantTransitionAction.counter
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
                            Text("count: \(item.count)")
                        }
                    }
                }
            }
        }.navigationBarTitle("List Instant Transition")
    }
}

struct ContentView_ListInstantTransitionView: PreviewProvider {
    static var previews: some View {
        ListInstantTransitionView(
            store: .init(
                initialState: ListInstantTransitionState(),
                reducer: listInstantTransitionReducer,
                environment: ListInstantTransitionEnvironment()
            )
        )
    }
}
