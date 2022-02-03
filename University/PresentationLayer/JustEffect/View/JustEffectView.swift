//
//  JustEffectView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct JustEffectView: View {

    let store: Store<JustEffectState, JustEffectAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section("Just Effect") {
                    HStack {
                        Text("Number")
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counterState,
                                action: JustEffectAction.counter
                            )
                        ).buttonStyle(BorderlessButtonStyle())
                    }
                    if viewStore.isFactRequestInFlight {
                        Button("Cancel") { viewStore.send(.cancelButtonTapped)
                        }
                    } else {
                        Button("Get the fact") { viewStore.send(.generateFactButtonTapped)
                        }
                    }
                    Button("Get the random  fact") { viewStore.send(.randomButtonTapped)
                    }
                    if viewStore.isFactRequestInFlight {
                        ProgressView()
                    }
                    viewStore.numberFact.map(Text.init)
                }
            }.navigationBarTitle("Just Effect")
        }
    }
}


struct ContentView_JustEffectView: PreviewProvider {
    static var previews: some View {
        JustEffectView(
            store: .init(
                initialState: JustEffectState(),
                reducer: justEffectReducer,
                environment: JustEffectEnvironment()
            )
        )
    }
}
