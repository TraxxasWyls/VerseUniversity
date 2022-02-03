//
//  ScrumbleGenerator.swift
//  University
//
//  Created by Дмитрий Савинов on 03.02.2022.
//

import Foundation
import Combine

// MARK: - ScrumbleGenerator

public protocol ScrumbleGenerator {
    func scrumble(lenght: Int) -> AnyPublisher<String, Never> 
}
