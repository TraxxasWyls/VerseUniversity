//
//  UniversityApp.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import SwiftUI

@main
struct UniversityApp: App {
    var body: some Scene {
        WindowGroup {
            MegaCounterView(
                store: .init(
                    initialState: MegaCounterState(),
                    reducer: megaCounterReducer,
                    environment: MegaCounterEnvironment()
                )
            )
        }
    }
}
