//
//  FullScreenImageView.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Full Screen Image View
struct FullScreenImageView: View {
    // properties
    let photo: UnsplashPhoto
    @StateObject private var imageViewModel = ImageViewModel()
    
    var body: some View {
        Group {
            if let image = imageViewModel.image {
                VStack {
                    ImageBuilder {
                        Image(uiImage: image)
                    }
                    Text(photo.description ?? "")
                }
            } else {
                ProgressView()
            }
        } 
        .onAppear {
            if let url = URL(string: photo.urls.small) {
                imageViewModel.loadImage(url: url)
            }
        }
    }
}
