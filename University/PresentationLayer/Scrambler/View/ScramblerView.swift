//
//  ScramblerView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct ScramblerView: View {

    let store: Store<ScramblerState, ScramblerAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                if viewStore.isScrumbleRequestInFlight {
                    ProgressView()
                } else {
                    Text(viewStore.mainText).bold()
                }
                HStack {
                    Button("-") {
                        viewStore.send(.minusButtonTapped)
                    }
                    .background(.red)
                    .buttonStyle(.bordered)
                    .cornerRadius(20)
                    Text("Current lenght: \(viewStore.scrumbleLenght)")
                    Button("+") {
                        viewStore.send(.plusButtonTapped)
                    }
                    .background(.green)
                    .buttonStyle(.bordered)
                    .cornerRadius(20)
                }.padding(50)
            }.onTapGesture {
                viewStore.send(.generateButtonTapped)
            }
        }.navigationBarTitle(Text("Scrambler"))
    }
}


struct ContentView_ScramblerView: PreviewProvider {
    static var previews: some View {
        ScramblerView(
            store: .init(
                initialState: ScramblerState(),
                reducer: scramblerReducer,
                environment: ScramblerEnvironment()
            )
        )
    }
}
