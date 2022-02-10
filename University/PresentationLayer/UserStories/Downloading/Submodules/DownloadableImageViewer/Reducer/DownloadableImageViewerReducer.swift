//
//  DownloadableImageViewerReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE

typealias DownloadableImageViewerReducer = Reducer<DownloadableImageViewerState, DownloadableImageViewerAction, DownloadableImageViewerEnvironment>

let downloadableImageViewerReducer = DownloadableImageViewerReducer.empty.downloadable(
    state: \.downloadableImageState,
    action: /DownloadableImageViewerAction.downloading,
    environment: { _ in  DownloadableDataEnvironment()}
)
