//
//  UnsplashAPI.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import Moya

//MARK: - enum UnsplashAPI
enum UnsplashAPI {
    case photos
}
//MARK: - extension UnsplashAPI
extension UnsplashAPI: TargetType {

    var baseURL: URL { return URL(string: "https://api.unsplash.com")! }
    
    var path: String {
        switch self {
        case .photos:
            return "/photos"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .photos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .photos:
            return .requestParameters(parameters: ["client_id": "1Bx-QZ98YLgYL05jRKYBsAD_3JsqMI2qWe4cdca602w"], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
