//
//  ScrollableImageExampleReducer.swift
//  101-connect
//
//  Created by incetro on 11/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import VERSE

// MARK: - Reducer

/// A `ScrollableImageExample` module reducer
///
/// It's a function that describes how to evolve the current `ScrollableImageExampleState` to the next state given an action.
/// The `ScrollableImageExampleReducer` is also responsible for returning any effects that should be run, such as API requests,
/// which can be done by returning an `Effect` value
///
/// - Note: The thread on which effects output is important. An effect's output is immediately sent
///   back into the store, and `Store` is not thread safe. This means all effects must receive
///   values on the same thread, **and** if the `Store` is being used to drive UI then all output
///   must be on the main thread. You can use the `Publisher` method `receive(on:)` for make the
///   effect output its values on the thread of your choice.
let scrollableImageExampleReducer = ScrollableImageExampleReducer { state, action, environment in
    switch action {
    }
    return .none
}
