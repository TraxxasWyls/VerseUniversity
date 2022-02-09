//
//  DownloadServiceImplementation.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/19/21.
//

import VERSE
import Combine
import Foundation

// MARK: - DownloadServiceImplementation

public final class DownloadServiceImplementation {

    // MARK: - Properties

    /// URLSession instance
    private let session: URLSession

    // MARK: - Initializers

    public init(session: URLSession = .shared) {
        self.session = session
    }
}

// MARK: - DownloadService

extension DownloadServiceImplementation: DownloadService {

    public func download(from url: URL) -> Effect<DownloadServiceAction, DownloadServiceError> {
        .run { subscriber in

            let task = self.session.dataTask(with: url) { data, _, error in
                switch (data, error) {
                case let (.some(data), _):
                    subscriber.send(.response(data))
                    subscriber.send(completion: .finished)
                case (_, .some):
                    subscriber.send(completion: .failure(.unknown))
                case (.none, .none):
                    fatalError("Data and Error should not both be nil")
                }
            }

            let observation = task.progress.observe(\.fractionCompleted) { progress, _ in
                subscriber.send(.updateProgress(progress.fractionCompleted))
            }

            task.resume()

            return AnyCancellable {
                observation.invalidate()
                task.cancel()
            }
        }
    }
}
