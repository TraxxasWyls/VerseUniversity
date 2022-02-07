//
//  BetterAnimatedTimersView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct BetterAnimatedTimersView: View {

    let store: Store<BetterAnimatedTimersState, BetterAnimatedTimersAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            VStack {
                LazyVGrid(columns: columns) {
                    ForEachStore(store.scope(state: \.timerItems, action: BetterAnimatedTimersAction.timerItem(id:action:))) { itemStore in
                        WithViewStore(itemStore) { itemViewStore in
                            NavigationLink(
                                tag: itemViewStore.id,
                                selection: viewStore.binding(
                                    get: { $0.selection?.id },
                                    send: BetterAnimatedTimersAction.setNavigation
                                ),
                                destination: {
                                    TimerCounterView(
                                        store: store.scope(
                                            state: \.timerCounterState,
                                            action: BetterAnimatedTimersAction.timerCounter
                                        )
                                    )
                                }
                            ) {
                                TimerView(store: itemStore).scaleEffect(0.5)
                            }
                        }
                    }
                }
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
                .sheet(
                    isPresented: viewStore.binding(
                        get: \.allTimersDone,
                        send: BetterAnimatedTimersAction.setSheet
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
            }
        }
    }
}

struct ContentView_BetterAnimatedTimersView: PreviewProvider {
    static var previews: some View {
        BetterAnimatedTimersView(
            store: .init(
                initialState: BetterAnimatedTimersState(),
                reducer: betterAnimatedTimersReducer,
                environment: BetterAnimatedTimersEnvironment()
            )
        )
    }
}
