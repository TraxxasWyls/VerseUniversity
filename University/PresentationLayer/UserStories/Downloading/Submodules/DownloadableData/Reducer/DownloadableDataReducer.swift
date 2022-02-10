//
//  DownloadableDataReducer.swift
//  University
//
//  Created by Дмитрий Савинов on 10.02.2022.
//

import Foundation
import VERSE
import SwiftUI

// MARK: - Reducer

public extension Reducer {

    // MARK: - Alias

    typealias DownloadableDataReducer = Reducer<DownloadableDataState, DownloadableDataAction, DownloadableDataEnvironment>

    // MARK: - Downloadable

    func downloadable(
        state: WritableKeyPath<State, DownloadableDataState>,
        action: EnumKeyPath<Action, DownloadableDataAction>,
        environment: @escaping (Environment) -> DownloadableDataEnvironment
    ) -> Reducer {
        .combine(
            self,
            DownloadableDataReducer { state, action, environment in
                func fireDataRequest() -> Effect<DownloadableDataAction, Never> {
                    environment
                        .downloadService
                        .download(from: state.link)
                        .receive(on: environment.mainQueue)
                        .delay(for: 0.5, scheduler: environment.mainQueue)
                        .catchToEffect(DownloadableDataAction.response)
                        .cancellable(id: DownloadableDataCancelID(id: state.id))
                }

                switch action {
                case .downloadingButtonTapped:
                    if state.isDownloaded {
                        state.alert = DownloadableDataState.deleteAlert
                        return .none
                    } else if state.isDownloadingInProgress {
                        state.alert = DownloadableDataState.cancelAlert
                        return .none
                    }
                    state.isDownloadingInProgress.toggle()
                    return fireDataRequest()
                case .stopDownloading:
                    state.cleanDownloading()
                    return .cancel(id: DownloadableDataCancelID(id: state.id))
                case .removeDownloadedData:
                    state.cleanDownloading()
                case .response(.success(let responseAction)):
                    switch responseAction {
                    case let .response(data):
                        state.finishDownloading(data)
                        state.alert = nil
                    case let .updateProgress(progress):
                        state.downloadingProgres = progress
                    }
                case .response(.failure(let error)):
                    state.alert = .init(title: error.localizedDescription)
                case .cancelButtonTapped, .alertDesmissed:
                    state.alert = nil
                }
                return .none
            }
            .pullback(state: state, action: action, environment: environment)
        )
    }
}

// MARK: - DownloadableDataCancelID

private struct DownloadableDataCancelID: Hashable {
    let id: UUID
}
