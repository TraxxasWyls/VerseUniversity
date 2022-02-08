//
//  TimerView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct TimerView: View {

    let store: Store<TimerState, TimerAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            ZStack {
                ProgressRingView(
                    progress: viewStore.progress,
                    progressIntervalLenght: 1,
                    theme: viewStore.timerTheme
                )
                    .frame(width: 120, height: 120)
                    .animation(.easeInOut(duration: 0.62), value: viewStore.progress)
                Text("\(Int(viewStore.progress * 100))%")
                    .font(.system(size: 35, weight: .bold, design: .rounded))
                    .monospacedDigit()
                    .transition(.opacity)
            }
            .onDisappear {
                viewStore.send(.onDisappear)
            }
            .onAppear {
                viewStore.send(.onAppear)
            }
        }
    }
}


struct ContentView_TimerView: PreviewProvider {
    static var previews: some View {
        TimerView(
            store: .init(
                initialState: TimerState(
                    isTimerActive: true,
                    progress: 0.2
                ),
                reducer: timerReducer,
                environment: TimerEnvironment()
            )
        )
    }
}
