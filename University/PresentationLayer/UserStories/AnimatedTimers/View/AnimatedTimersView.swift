//
//  AnimatedTimersView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct AnimatedTimersView: View {

    let store: Store<AnimatedTimersState, AnimatedTimersAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                HStack {
                    NavigationLink(
                        destination:
                            TimerCounterView(
                                store: store.scope(
                                    state: \.firstCounterTimerState,
                                    action: AnimatedTimersAction.firstCounterTimer
                                )
                            )
                    ) {
                        TimerView(
                            store: store.scope(
                                state: \.firtstTimerState,
                                action: AnimatedTimersAction.firstTimer
                            )
                        )
                        .padding()
                    }
                    NavigationLink(
                        destination:
                            TimerCounterView(
                                store: store.scope(
                                    state: \.secondCounterTimerState,
                                    action: AnimatedTimersAction.secondCounterTimer
                                )
                            )
                    ) {
                        TimerView(
                            store: store.scope(
                                state: \.secondTimerState,
                                action: AnimatedTimersAction.secondTimer
                            )
                        )
                        .padding()
                    }
                }
                HStack {
                    NavigationLink(
                        destination:
                            TimerCounterView(
                                store: store.scope(
                                    state: \.thirdCounterTimerState,
                                    action: AnimatedTimersAction.thirdCounterTimer
                                )
                            )
                    ) {
                        TimerView(
                            store: store.scope(
                                state: \.thirdTimerState,
                                action: AnimatedTimersAction.thirdTimer
                            )
                        )
                        .padding()
                    }
                    NavigationLink(
                        destination:
                            TimerCounterView(
                                store: store.scope(
                                    state: \.fourthCounterTimerState,
                                    action: AnimatedTimersAction.fourthCounterTimer
                                )
                            )
                    ) {
                        TimerView(
                            store: store.scope(
                                state: \.fourthTimerState,
                                action: AnimatedTimersAction.fourthTimer
                            )
                        )
                        .padding()
                    }
                }
                .padding()
                HStack {
                    Button("Parallel") {
                        viewStore.send(.parallelButtonTapped)
                    }
                    .background(.red)
                    .buttonStyle(.bordered)
                    .cornerRadius(20)
                    Button(viewStore.state.isTimersOnFire ? "Stop" : "Play") {
                        viewStore.send(.playOrPauseButtonTapped)
                    }
                    .padding()
                    Button("Consecutive") {
                        viewStore.send(.consecutiveButtonTapped)
                    }
                    .background(.green)
                    .buttonStyle(.bordered)
                    .cornerRadius(20)
                }.padding(50)
            }
            .sheet(
                isPresented: viewStore.binding(
                    get: \.allTimersDone,
                    send: AnimatedTimersAction.setSheet
                ),
                content: {
                    Text.init("Done!")
                        .font(.system(size: 70, weight: .bold, design: .rounded))
                        .monospacedDigit()
                        .transition(.opacity)
                }
            )
        }.navigationBarTitle(Text("AnimatedTimers"))
    }
}


struct ContentView_AnimatedTimersView: PreviewProvider {
    static var previews: some View {
        AnimatedTimersView(
            store: .init(
                initialState: AnimatedTimersState(),
                reducer: animatedTimersReducer,
                environment: AnimatedTimersEnvironment()
            )
        )
    }
}
