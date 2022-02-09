//
//  DownloadService.swift
//  verse-swiftui-examples
//
//  Created by incetro on 11/19/21.
//

import VERSE
import Foundation

// MARK: - DownloadServiceAction

public enum DownloadServiceAction: Equatable {

    // MARK: - Cases

    case response(Data)
    case updateProgress(Double)
}

// MARK: - DownloadServiceError

public enum DownloadServiceError: LocalizedError, Equatable {

    case unknown
}

// MARK: - DownloadService

public protocol DownloadService {

    /// Download data from the given url
    func download(from url: URL) -> Effect<DownloadServiceAction, DownloadServiceError>
}
