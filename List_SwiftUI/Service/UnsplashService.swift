//
//  UnsplashService.swift
//  List_SwiftUI
//
//  Created by aaa on 09/06/2023.
//

import Moya

//MARK: - UnsplashService
class UnsplashService {
    //static properties
    static let provider = MoyaProvider<UnsplashAPI>()
    
   static func fetchPhotos(completion: @escaping (Result<[UnsplashPhoto], Error>) -> Void) {
        provider.request(.photos) { result in
            switch result {
            case .success(let response):
                do {
                    let photos = try JSONDecoder().decode([UnsplashPhoto].self, from: response.data)
                    completion(.success(photos))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
