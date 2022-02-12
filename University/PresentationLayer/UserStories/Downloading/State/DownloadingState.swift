//
//  DownloadingState.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import Foundation
import VERSE
import SwiftUI

// MARK: - DownloadingState

public struct DownloadingState: Equatable {

    // MARK: - Properties

    public var items: IdentifiedArrayOf<DownloadableImageViewerState> = [
        DownloadableImageViewerState(
            downloadableImageState: .init(
                title: "Samantha Sophia",
                link: .init(
                    string: "https://picsum.photos/3240/2220"
                ).unsafelyUnwrapped
            )
        ),
        DownloadableImageViewerState(
            downloadableImageState: .init(
                title: "A girl",
                link: .init(
                    string: "https://picsum.photos/id/1011/930/620"
                ).unsafelyUnwrapped
            )
        ),
        DownloadableImageViewerState(
            downloadableImageState: .init(
                title: "Skyscraper",
                link: .init(
                    string: "https://picsum.photos/id/1031/930/620"
                ).unsafelyUnwrapped
            )
        ),
    ]
}
