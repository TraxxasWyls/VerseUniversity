//
//  DownloadableDataAction.swift
//  University
//
//  Created by Дмитрий Савинов on 10.02.2022.
//

import Foundation

// MARK: - DownloadableDataAction

public enum DownloadableDataAction: Equatable {
    case downloadingButtonTapped
    case stopDownloading
    case removeDownloadedData

    case cancelButtonTapped
    case alertDesmissed

    case response(Result<DownloadServiceAction, DownloadServiceError>)
}
