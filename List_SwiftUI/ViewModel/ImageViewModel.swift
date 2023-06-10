//
//  ImageViewModel.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Image View Model
class ImageViewModel: ObservableObject {
    // properties
    @Published var image: UIImage? = nil

    func loadImage(url: URL) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }.resume()
    }
}
