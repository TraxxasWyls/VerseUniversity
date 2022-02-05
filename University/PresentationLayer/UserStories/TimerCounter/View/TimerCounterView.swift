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
                    CircleButton(
                        image: .init(systemName: "minus"),
                        gradient: [
                            .init(color: .red, location: 0),
                            .init(color: .yellow, location: 1)
                        ]
                    ) {
                        viewStore.send(.decrementButtonTapped)
                    }
                    .padding()
                    CircleButton(
                        image: .init(systemName: "plus"),
                        gradient: [
                            .init(color: .yellow, location: 0),
                            .init(color: .green, location: 1)
                        ]
                    ) {
                        viewStore.send(.incrementButtonTapped)
                    }
                    .padding()

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
