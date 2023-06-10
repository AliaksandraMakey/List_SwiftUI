//
//  ImageListViewModel.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Image List View Model
class ImageListViewModel: ObservableObject {
    // properties
    @Published var images = [UnsplashPhoto]()
    private let imageService: UnsplashService
    // init
    init(imageService: UnsplashService = UnsplashService()) {
        self.imageService = imageService
    }
    func fetchImages() {
        UnsplashService.fetchPhotos { [weak self] result in
            switch result {
            case .success(let photos):
                DispatchQueue.main.async {
                    self?.images = photos
                }
            case .failure(let error):
                print("Ошибка получения фотографий: \(error)")
            }
        }
    }
}
