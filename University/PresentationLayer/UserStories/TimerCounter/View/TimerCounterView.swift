//
//  TimerCounterView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct TimerCounterView: View {

    let store: Store<TimerCounterState, TimerCounterAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                TimerView(
                    store: store.scope(
                        state: \.timerState,
                        action: TimerCounterAction.timer
                    )
                )
                HStack {
                    Button("-") {
                        viewStore.send(.decrementButtonTapped)
                    }
                    .background(.red)
                    .buttonStyle(.bordered)
                    .cornerRadius(20)
                    Button("+") {
                        viewStore.send(.incrementButtonTapped)
                    }
                    .background(.green)
                    .buttonStyle(.bordered)
                    .cornerRadius(20)
                }.padding(50)
            }
        }.navigationBarTitle(Text("TimerCounter"))
    }
}


struct ContentView_TimerCounterView: PreviewProvider {
    static var previews: some View {
        TimerCounterView(
            store: .init(
                initialState: TimerCounterState(),
                reducer: timerCounterReducer,
                environment: TimerCounterEnvironment()
            )
        )
    }
}
