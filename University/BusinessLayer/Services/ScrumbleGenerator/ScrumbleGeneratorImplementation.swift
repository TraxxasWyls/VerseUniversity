//
//  ScrumbleGeneratorImplementation.swift
//  University
//
//  Created by Дмитрий Савинов on 03.02.2022.
//

import Foundation
import Combine

// MARK: - ScrumbleGeneratorImplementation

public class ScrumbleGeneratorImplementation {

    private func scramble(of length: Int) -> String {

        let notations = ["F", "B", "R", "U", "D", "L"].map {
            [$0, $0 + "'", $0 + "2"]
        }

        var previousFace = 0
        var randomFace = Int(arc4random_uniform(6))
        var result = ""

        for i in 0..<length {
            while previousFace == randomFace {
                randomFace = Int(arc4random_uniform(6))
            }
            previousFace = randomFace
            let randomTurn = Int(arc4random_uniform(3))
            let notation = notations[randomFace][randomTurn]
            if i == 0 {
                result += notation
            } else {
                result += " \(notation)"
            }
        }
        return result
    }
}

// MARK: - ScrumbleGenerator

extension ScrumbleGeneratorImplementation: ScrumbleGenerator {

    public func scrumble(lenght: Int) -> AnyPublisher<String, Never> {
        .init(Just(scramble(of: lenght)))
        .delay(for: 0.5, scheduler: RunLoop.main)
        .eraseToAnyPublisher()
    }
}
