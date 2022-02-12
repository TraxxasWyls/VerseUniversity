//
//  ScrollableImageExampleEnvironment.swift
//  101-connect
//
//  Created by incetro on 11/02/2022.
//  Copyright © 2022 Incetro Inc. All rights reserved.
//

import VERSE
import Foundation

// MARK: - ScrollableImageExampleEnvironment

/// `ScrollableImageExample` module environment.
///
/// `Environment` is a type that holds any dependencies the feature needs,
/// such as API clients, analytics clients, etc.
struct ScrollableImageExampleEnvironment {

    // MARK: - Properties
}

// MARK: - Convenience

/// Here we have some assistive properties which will help us
/// to use `ScrollableImageExample` module with `pullback`, `forEach`, etc. more easily
extension ScrollableImageExampleEnvironment {

    /// Real environment wrapped in this property.
    ///
    /// Instead of this:
    ///
    ///     scrollableImageExampleReducer.pullback(
    ///         state: \.scrollableImageExample,
    ///         action: /MainAction.scrollableImageExample,
    ///         environment: ScrollableImageExampleComposer.environment()
    ///     )
    /// 
    /// Or even this:
    ///
    ///     scrollableImageExampleReducer.pullback(
    ///         state: \.scrollableImageExample,
    ///         action: /MainAction.scrollableImageExample,
    ///         environment: ScrollableImageExampleEnvironment()
    ///     )
    ///
    /// You can use this:
    /// 
    ///     scrollableImageExampleReducer.pullback(
    ///         state: \.scrollableImageExample,
    ///         action: /MainAction.scrollableImageExample,
    ///         environment: .real
    ///     )
    static var real: Self {
        ScrollableImageExampleComposer().environment()
    }
}
