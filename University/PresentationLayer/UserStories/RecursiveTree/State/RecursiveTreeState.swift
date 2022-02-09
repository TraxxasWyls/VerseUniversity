//
//  RecursiveTreeState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - RecursiveTreeState

public struct RecursiveTreeState: Equatable, Identifiable, Hashable {

    // MARK: - Properties

    public let id = UUID()

    @BindableState public var name: String

    public var children: IdentifiedArrayOf<RecursiveTreeState> = []
}

// MARK: - Random

extension RecursiveTreeState {

    private static let maxChildrenCount = 6

    static func random(childrenCount: Int = maxChildrenCount) -> RecursiveTreeState {
        .init(
            name: childrenCount == maxChildrenCount ? "" : String.randomString(length: childrenCount + 1),
            children: .init(
                (0..<childrenCount).map { _ in
                        .random(childrenCount: childrenCount - 1)
                }
            )
        )
    }
}
