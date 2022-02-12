//
//  DownloadableDataButton.swift
//  University
//
//  Created by Дмитрий Савинов on 10.02.2022.
//

import Foundation
import SwiftUI
import VERSE

public struct DownloadableDataButton: View {

    // MARK: - Properties

    let store: Store<DownloadableDataState, DownloadableDataAction>

    // MARK: - View

    public var body: some View {
        WithViewStore(store) { viewStore in
            Button(action: { viewStore.send(.downloadingButtonTapped) }) {
                if viewStore.isDownloaded {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: 20, height: 20)
                } else if viewStore.isDownloadingInProgress, viewStore.downloadingProgres != 0 {
                    ZStack {
                        ProgressRingView(
                            progress: viewStore.downloadingProgres,
                            theme: ProgressViewTheme(lineWidth: 2)
                        )
                            .frame(width: 25, height: 25)
                        Rectangle()
                            .frame(width: 8, height: 8)
                            .foregroundColor(Color.blue)
                    }
                } else if viewStore.isDownloadingInProgress, viewStore.downloadingProgres == 0 {
                    ZStack {
                        ProgressView()
                            .frame(width: 25, height: 25)
                        Rectangle()
                            .frame(width: 3, height: 3)
                            .foregroundColor(Color.gray)
                    }
                } else if !viewStore.isDownloaded {
                    Image(systemName: "icloud")
                        .accentColor(Color.blue)
                }
            }
            .alert(store.scope(state: \.alert), dismiss: .alertDesmissed)
        }
    }
}
