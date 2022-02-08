//
//  ListDeferedTransitionState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

// MARK: - SimpleListItemState

public struct SimpleLoadableListItemState: Equatable, Identifiable {

    // MARK: - Properties

    public let id: UUID = .init()

    public let color: Color

    public let title: String

    public var count: Int

    public var isLoading = false
}


// MARK: - ListDeferedTransitionState

public struct ListDeferedTransitionState: Equatable {

    // MARK: - Properties

    public var items: IdentifiedArrayOf<SimpleLoadableListItemState> = [
        SimpleLoadableListItemState(color: .gray, title: "gray one", count: 7),
        SimpleLoadableListItemState(color: .blue, title: "blue one", count: 17),
        SimpleLoadableListItemState(color: .red, title: "red one", count: 117),
        SimpleLoadableListItemState(color: .green, title: "green one", count: 1117),
        SimpleLoadableListItemState(color: .cyan, title: "cyan one", count: 11117),
        SimpleLoadableListItemState(color: .yellow, title: "yellow one", count: 0),
    ]

    public var selection: Identified<UUID, CounterState?>?
}
