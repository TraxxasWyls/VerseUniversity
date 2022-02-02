//
//  FlexibleBindingView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

// MARK: - FlexibleBindingView

public struct FlexibleBindingView: View {

    // MARK: - Properties

    let store: Store<FlexibleBindingState, FlexibleBindingAction>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text("Flexible Binding")) {
                    Picker("", selection: viewStore.binding(\.$pickedColor)) {
                        ForEach(viewStore.colors, id: \.self) {
                            Text($0.rawValue.capitalized).tag($0.color)
                        }
                    }
                    .pickerStyle(.segmented)
                    .disabled(viewStore.controlDisabled)

                    TextField(
                        "Введи свой текст, Щенок",
                        text: viewStore.binding(\.$text)
                    ).disabled(viewStore.controlDisabled)

                    Toggle(
                        isOn: viewStore.binding(\.$controlDisabled)
                    ) {
                        Text("Бан жопы")
                    }

                    HStack {
                        Text("Макс размер слайдера")
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counter,
                                action: FlexibleBindingAction.counter
                            )
                        )
                            .buttonStyle(BorderlessButtonStyle())
                    }

                    HStack {
                        Text("Слайдер: \(viewStore.counter.count)")
                        Spacer()
                        Slider(
                            value: viewStore.binding(\.$sliderValue),
                            in: 0...Double(viewStore.counter.count),
                            step: 1
                        ).disabled(viewStore.controlDisabled)
                    }

                    Button("Сброс") {
                        viewStore.send(FlexibleBindingAction.controlReseted)
                    }
                }.textCase(nil)
            }.accentColor(viewStore.pickedColor.color)
        }.navigationBarTitle("Flexible Binding")
    }
}


struct ContentView_FlexibleBindingView: PreviewProvider {
    static var previews: some View {
        FlexibleBindingView(
            store: .init(
                initialState: FlexibleBindingState(),
                reducer: flexibleBindingReducer,
                environment: FlexibleBindingEnvironment()
            )
        )
    }
}
