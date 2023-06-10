//
//  Authentication.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Authentication
class Authentication: ObservableObject {
    // properties
    @Published var isValidated = false
    //MARK: - Authentication Error
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        case invalideID
        var id: String {
            self.localizedDescription
        }
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Ваш адрес электронной почты или пароль неверны. Пожалуйста, попробуйте еще раз.",
                                         comment: "")
            case .invalideID:
                return NSLocalizedString("Пользователь не зарегистрирован.",
                                         comment: "")
            }
        }
    }
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}
