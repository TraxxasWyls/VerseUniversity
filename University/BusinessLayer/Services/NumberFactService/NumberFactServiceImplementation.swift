//
//  NumberFactServiceImplementation.swift
//  University
//
//  Created by Дмитрий Савинов on 03.02.2022.
//

import Foundation
import Combine

// MARK: - NumberFactServiceImplementation

public final class NumberFactServiceImplementation {

    // MARK: - Properties

    private let session: URLSession

    // MARK: - Initializers

    public init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - NumberFactService

extension NumberFactServiceImplementation: NumberFactService {

    public func obtain(number: Int) -> AnyPublisher<String, NumberFactError> {
        let url: URL = .init(string: "http://numbersapi.com/\(number)").unsafelyUnwrapped
        return session
            .dataTaskPublisher(for: url)
            .map { data, _ in
                return String(decoding: data, as: UTF8.self)
            }
            .mapError { error in
                NumberFactError.unknown(error.localizedDescription)
            }
            .delay(for: 1, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
