//
//  DownloadingView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct DownloadingView: View {

    let store: Store<DownloadingState, DownloadingAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            Form {
                ForEachStore(store.scope(state: \.items, action: DownloadingAction.downloadableImageItem(id:action:))) { itemStore in
                    WithViewStore(itemStore) { itemViewStore in
                        NavigationLink(
                            destination: DownloadableImageViewerView(store: itemStore)
                        ) {
                            HStack {
                                if let data = itemViewStore.downloadableImageState.data,
                                   let uiImage = UIImage(data: data),
                                   let image = Image(uiImage: uiImage) {
                                    image
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(6)
                                }
                                Text(itemViewStore.downloadableImageState.title)
                                Spacer()
                                DownloadableDataButton(
                                    store: itemStore.scope(
                                        state: \.downloadableImageState,
                                        action: DownloadableImageViewerAction.downloading
                                    )
                                ).buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Downloads")
        }
    }
}

struct ContentView_DownloadingView: PreviewProvider {
    static var previews: some View {
        DownloadingView(
            store: .init(
                initialState: DownloadingState(),
                reducer: downloadingReducer,
                environment: DownloadingEnvironment()
            )
        )
    }
}
