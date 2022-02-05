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
                    CircleButton(
                        image: .init(systemName: "repeat.1"),
                        gradient: [
                            .init(color: .blue, location: 1)
                        ]
                    ) {
                        viewStore.send(.parallelButtonTapped)
                    }
                    .padding()
                    CircleButton(
                        image: .init(systemName: viewStore.state.isTimersOnFire ? "pause.fill" : "play.fill"),
                        gradient: [
                            .init(color: .green, location: 0),
                            .init(color: viewStore.state.isTimersOnFire ? .red : .green, location: 1)
                        ]
                    ) {
                        viewStore.send(.playOrPauseButtonTapped)
                    }
                    .padding()
                    CircleButton(
                        image: .init(systemName: "shuffle"),
                        gradient: [
                            .init(color: .blue, location: 1)
                        ]
                    ) {
                        viewStore.send(.consecutiveButtonTapped)
                    }
                    .padding()
                }
            }
            .sheet(
                isPresented: viewStore.binding(
                    get: \.allTimersDone,
                    send: AnimatedTimersAction.setSheet
                ),
                content: {
                    HStack {
                        Text.init("Done!")
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .monospacedDigit()
                            .transition(.opacity)
                    }.padding()
                    ZStack {
                        Image(systemName: "checkmark.circle")
                            .font(.system(size: 80, weight: .light))
                    }
                    .frame(width: 100, height: 100)
                    .background(
                        ZStack {
                            Circle()
                                .fill(.green)
                                .frame(width: 100, height: 100)//Button Size.
                                .shadow(color: .gray.opacity(0.2), radius: 8, x: -8, y: -8)
                                .shadow(color: .gray.opacity(0.2), radius: 8, x: 8, y: 8)
                        }
                    )
                }
            )
        }.navigationBarTitle(Text("Animated Timers"))
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
