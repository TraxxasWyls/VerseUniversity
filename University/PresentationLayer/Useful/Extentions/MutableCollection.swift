//
//  MutableCollection.swift
//  University
//
//  Created by Дмитрий Савинов on 07.02.2022.
//

import Foundation

// MARK: - MutableCollection

extension MutableCollection {

    mutating func updateEach(_ update: (inout Element) -> Void) {
        for i in indices {
            update(&self[i])
        }
    }
}
