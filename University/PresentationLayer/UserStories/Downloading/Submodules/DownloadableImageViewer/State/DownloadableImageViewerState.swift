//
//  DownloadableImageViewerState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

// MARK: - DownloadableImageViewerState

public struct DownloadableImageViewerState: Identifiable, Equatable {

    // MARK: - Properties

    public let id = UUID()

    public var downloadableImageState: DownloadableDataState

    public var navigationBarText: String {
        downloadableImageState.title
    }

    public var text: String {
        downloadableImageState.isDownloaded ? "" : "Now downloaded"
    }
}
