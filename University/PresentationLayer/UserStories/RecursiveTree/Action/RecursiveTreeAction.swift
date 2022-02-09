//
//  RecursiveTreeAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - RecursiveTreeAction

public indirect enum RecursiveTreeAction: Equatable {
    case append
    case child(id: RecursiveTreeState.ID, action: RecursiveTreeAction)
    case remove(IndexSet)
}
