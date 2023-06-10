//
//  AuthService.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import Foundation

//MARK: - Auth Service
class AuthService {
    // properties
    static let login = "alex"
    static let password = "333"
    
    static func login(user: User,
               completion: @escaping ((Result<Bool, Authentication.AuthenticationError>)-> Void)) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if user.password == password && user.login == login {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
