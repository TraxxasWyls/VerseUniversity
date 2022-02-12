//
//  ScrollableImageExampleComposer.swift
//  101-connect
//
//  Created by incetro on 11/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import VERSE
import Foundation

// MARK: - ScrollableImageExampleComposer

/// `ScrollableImageExample` module composer
///
/// `ScrollableImageExampleComposer` is responsible for making `ScrollableImageExample` module instances.
/// You can choose a specification from `Specification` which defines your module type.
final class ScrollableImageExampleComposer {

    // MARK: - Composition

    /// Create a new `ScrollableImageExampleView` instance for the given specification
    /// - Parameter specification: target specification value
    /// - Returns: a new `ScrollableImageExampleView` instance for the given specification
    func view() -> ScrollableImageExampleView {
        ScrollableImageExampleView(store: store())
    }

    /// Create a new `ScrollableImageExampleStore` instance for the given specification
    /// - Parameter specification: target specification value
    /// - Returns: a new `ScrollableImageExampleStore` instance for the given specification
    func store() -> ScrollableImageExampleStore {
        ScrollableImageExampleStore(
            initialState: ScrollableImageExampleState(),
            reducer: scrollableImageExampleReducer,
            environment: environment()
        )
    }

    /// Create a new `ScrollableImageExampleEnvironment` instance for the given specification
    /// - Parameter specification: target specification value
    /// - Returns: a new `ScrollableImageExampleEnvironment` instance for the given specification
    func environment() -> ScrollableImageExampleEnvironment {
        ScrollableImageExampleEnvironment()
    }
}

// MARK: - Aliases

/// `Reducer` alias
typealias ScrollableImageExampleReducer = Reducer<ScrollableImageExampleState, ScrollableImageExampleAction, ScrollableImageExampleEnvironment>

/// `Store` alias
typealias ScrollableImageExampleStore = Store<ScrollableImageExampleState, ScrollableImageExampleAction>
