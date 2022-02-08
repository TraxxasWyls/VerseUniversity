//
//  ListInstantTransitionState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

// MARK: - SimpleListItemState

public struct SimpleListItemState: Equatable, Identifiable {

    // MARK: - Properties

    public let id: UUID = .init()

    public let color: Color

    public let title: String

    public var count: Int
}

// MARK: - ListInstantTransitionState

public struct ListInstantTransitionState: Equatable {

    // MARK: - Properties

    public var items: IdentifiedArrayOf<SimpleListItemState> = [
        SimpleListItemState(color: .gray, title: "gray one", count: 7),
        SimpleListItemState(color: .blue, title: "blue one", count: 17),
        SimpleListItemState(color: .red, title: "red one", count: 117),
        SimpleListItemState(color: .green, title: "green one", count: 1117),
        SimpleListItemState(color: .cyan, title: "cyan one", count: 11117),
        SimpleListItemState(color: .yellow, title: "yellow one", count: 0),
    ]

    public var selection: Identified<UUID, CounterState?>?
}
