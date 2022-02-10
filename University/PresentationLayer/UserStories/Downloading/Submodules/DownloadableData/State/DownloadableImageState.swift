//
//  DownloadableImageState.swift
//  University
//
//  Created by Дмитрий Савинов on 10.02.2022.
//

import Foundation
import VERSE

// MARK: - DownloadableImageState

public struct DownloadableDataState: Equatable, Identifiable {

    // MARK: - Properties

    public let id: UUID = .init()

    public let title: String

    public let link: URL

    public var data: Data?

    public var alert: AlertState<DownloadableDataAction>?

    public var downloadingProgres: Double = 0

    public var isDownloaded: Bool = false

    public var isDownloadingInProgress: Bool = false
}

// MARK: - Mutating

extension DownloadableDataState {

    public mutating func cleanDownloading() {
        data = nil
        downloadingProgres = 0
        isDownloaded = false
        isDownloadingInProgress = false
    }

    public mutating func finishDownloading(_ data: Data) {
        self.data = data
        downloadingProgres = 1
        isDownloaded = true
        isDownloadingInProgress = false
    }
}

// MARK: - Alerts

extension DownloadableDataState {

    public static let deleteAlert: AlertState<DownloadableDataAction> = .init(
        title: .init("Ohh myyyy!"),
        message: .init("Remove it from storage?"),
        primaryButton: .destructive(.init("Remove"), send: .stopDownloading),
        secondaryButton: .cancel(send: .cancelButtonTapped)
    )

    public static let cancelAlert: AlertState<DownloadableDataAction> = .init(
        title: .init("Warning!!!"),
        message: .init("Stop downloading?"),
        primaryButton: .destructive(.init("Stop"), send: .stopDownloading),
        secondaryButton: .cancel(send: .cancelButtonTapped)
    )
}
