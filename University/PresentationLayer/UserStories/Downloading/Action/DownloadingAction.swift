//
//  DownloadingAction.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation

// MARK: - DownloadingAction

public enum DownloadingAction: Equatable {
    case downloadableImageItem(id: UUID, action: DownloadableImageViewerAction)
}
