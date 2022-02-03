//
//  NumberFactService.swift
//  University
//
//  Created by Дмитрий Савинов on 03.02.2022.
//

import Combine

// MARK: - NumberFactError

public enum NumberFactError: Error, Equatable {
    case unknown(String)
}

// MARK: - NumberFactService

public protocol NumberFactService {

    func obtain(number: Int) -> AnyPublisher<String, NumberFactError>
}
