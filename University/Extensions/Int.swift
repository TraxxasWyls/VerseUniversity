//
//  Int.swift
//  University
//
//  Created by Дмитрий Савинов on 31.01.2022.
//

import Foundation

// MARK: - Int

public extension Int {

    var isPerfectSquare: Bool {
        let s = Int(sqrt(Double(self)))
        return s * s == self
    }

    var isFibonacci: Bool {
        let firstCondition = (5 * self * self + 4).isPerfectSquare
        let secondCondition = (5 * self * self - 4).isPerfectSquare
        return firstCondition || secondCondition
    }
}
