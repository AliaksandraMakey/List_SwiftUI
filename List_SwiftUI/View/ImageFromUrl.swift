//
//  ImageFromUrl.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Image From Url
struct ImageFromUrl: View {
    // properties
    let url: URL
    @StateObject private var imageViewModel = ImageViewModel()
    
    var body: some View {
        Group {
            if let image = imageViewModel.image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
            } else {
                ProgressView()
            }
        }.onAppear {
            imageViewModel.loadImage(url: url)
        }
    }
}
