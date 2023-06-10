//
//  UnsplashPhoto.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import Foundation

//MARK: - Unsplash Photo
struct UnsplashPhoto: Decodable {
    //MARK: - URLs
    struct URLs: Decodable {
        // properties
        let small: String
//        let raw: String
//        let full: String
//        let regular: String
//        let thumb: String
    }
    // properties
    let id: String
    let description: String?
    let altDescription: String?
    let urls: URLs
}
