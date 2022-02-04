//
//  SimpleBindingView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

// MARK: - SimpleBindingView

public struct SimpleBindingView: View {

    // MARK: - Properties

    let store: Store<SimpleBindingState, SimpleBindingAction>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                Section(header: Text("Simple Bindings")) {
                    Picker(
                        "",
                        selection: viewStore.binding(
                            get: \.pickedColor,
                            send: SimpleBindingAction.colorChanged
                        )
                    ) {
                        ForEach(viewStore.colors, id: \.self) {
                            Text($0.rawValue.capitalized).tag($0.color)
                        }
                    }
                    .pickerStyle(.segmented)
                    .disabled(viewStore.controlDisabled)

                    TextField(
                        "Введи свой текст, Щенок",
                        text: viewStore.binding(
                            get: \.text,
                            send: SimpleBindingAction.textChanged
                        )
                    ).disabled(viewStore.controlDisabled)

                    Toggle(
                        isOn: viewStore.binding(
                            get: \.controlDisabled,
                            send: SimpleBindingAction.disabledStateChanged
                        )
                    ) {
                        Text("Бан жопы")
                    }

                    HStack {
                        Text("Макс размер слайдера")
                        Spacer()
                        CounterView(
                            store: store.scope(
                                state: \.counter,
                                action: SimpleBindingAction.counter
                            )
                        )
                            .buttonStyle(BorderlessButtonStyle())
                    }

                    HStack {
                        Text("Слайдер: \(viewStore.counter.count)")
                        Spacer()
                        Slider(
                            value: viewStore.binding(
                                get: \.sliderValue,
                                send: SimpleBindingAction.sliderValueChanged
                            ),
                            in: 0...Double(viewStore.counter.count),
                            step: 1
                        ).disabled(viewStore.controlDisabled)
                    }

                    Button("Сброс") {
                        viewStore.send(SimpleBindingAction.controlReseted)
                    }
                }.textCase(nil)
            }.accentColor(viewStore.pickedColor.color)
        }.navigationBarTitle("Simple Bindings")
    }
}


struct ContentView_SimpleBindingView: PreviewProvider {
    static var previews: some View {
        SimpleBindingView(
            store: .init(
                initialState: SimpleBindingState(),
                reducer: simpleBindingReducer,
                environment: SimpleBindingEnvironment()
            )
        )
    }
}
