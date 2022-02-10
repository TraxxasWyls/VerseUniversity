//
//  DownloadingReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

typealias DownloadingReducer = Reducer<DownloadingState, DownloadingAction, DownloadingEnvironment>

let downloadingReducer = DownloadingReducer.combine(
    .empty,
    downloadableImageViewerReducer.forEach(
        state: \.items,
        action: /DownloadingAction.downloadableImageItem(id:action:),
        environment: DownloadableImageViewerEnvironment()
    )
)
