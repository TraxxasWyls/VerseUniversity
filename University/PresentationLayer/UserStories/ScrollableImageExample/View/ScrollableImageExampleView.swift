//
//  ScrollableImageExampleView.swift
//  101-connect
//
//  Created by incetro on 11/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import VERSE
import SwiftUI

// MARK: - ScrollableImageExampleView

/// A visual representation of `ScrollableImageExample` module.
/// Here we define the view that displays the feature.
/// It holds onto a `Store<ScrollableImageExampleState, ScrollableImageExampleAction>` so that it can observe
/// all changes to the state and re-render, and we can send all user actions
/// to the store so that state changes.
struct ScrollableImageExampleView: View {

    // MARK: - Properties

    /// `ScrollableImageExample` module `Store` instance
    private let store: ScrollableImageExampleStore

    // MARK: - Initializers

    /// Default initializer
    /// - Parameters:
    ///   - store: ScrollableImageExampleStore instance
    init(store: ScrollableImageExampleStore) {
        self.store = store
    }

    // MARK: - View

    var body: some View {
        WithViewStore(store) { viewStore in
            CenteringViewer()
        }
    }
}
