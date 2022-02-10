//
//  DownloadableImageViewerView.swift
//  University
//
//  Created by Дмитрий Савинов on 02.02.2022.
//

import SwiftUI
import VERSE

struct DownloadableImageViewerView: View {

    let store: Store<DownloadableImageViewerState, DownloadableImageViewerAction>

    var body: some View {
        WithViewStore(store) { viewStore in
            VStack {
                if  let data = viewStore.downloadableImageState.data,
                    let uiImage = UIImage(data: data),
                    let image = Image(uiImage: uiImage) {
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .padding()
                }
                if viewStore.downloadableImageState.isDownloadingInProgress {
                    ProgressView()
                }
                HStack {
                    Text(viewStore.text)
                    Spacer()
                    DownloadableDataButton(
                        store: store.scope(
                            state: \.downloadableImageState,
                            action: DownloadableImageViewerAction.downloading
                        )
                    )
                }.padding([.leading, .trailing], 40)
                Spacer()
            }.navigationBarTitle(Text(viewStore.downloadableImageState.title))
        }
    }
}


struct ContentView_DownloadableImageViewerView: PreviewProvider {
    static var previews: some View {
        DownloadableImageViewerView(
            store: .init(
                initialState: DownloadableImageViewerState(downloadableImageState: .init(title: "kekos", link: .init(
                    string: "https://picsum.photos/id/1011/930/620"
                ).unsafelyUnwrapped)),
                reducer: downloadableImageViewerReducer,
                environment: DownloadableImageViewerEnvironment()
            )
        )
    }
}
