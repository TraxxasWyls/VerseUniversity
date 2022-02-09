//
//  RecursiveTreeAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - RecursiveTreeAction

public indirect enum RecursiveTreeAction: BindableAction, Equatable {
    case binding(BindingAction<RecursiveTreeState>)
    case append
    case child(id: RecursiveTreeState.ID, action: RecursiveTreeAction)
    case remove(IndexSet)
}
