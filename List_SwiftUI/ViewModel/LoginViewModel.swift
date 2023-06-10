//
//  LoginViewModel.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import Foundation

//MARK: - Login View Model
class LoginViewModel: ObservableObject {
    // properties
    @Published var user = User()
    @Published var showProgressView = false
    @Published var error: Authentication.AuthenticationError?
    
    @Published var incorrectAttempts = 0
    @Published var isInputBlocked = false
    @Published var blockExpirationTime: Date?
    
    var loginDisabled: Bool {
        isInputBlocked || user.login.isEmpty || user.password.isEmpty
    }
    
    var remainingBlockTime: TimeInterval? {
        guard let expirationTime = blockExpirationTime else {
            return nil
        }
        return max(expirationTime.timeIntervalSinceNow, 0)
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        if isInputBlocked {
            completion(false)
            return
        }
        
        showProgressView = true
        AuthService.login(user: user) { [unowned self] (result: Result<Bool, Authentication.AuthenticationError>) in
            showProgressView = false
            switch result {
            case .success:
                resetAttempts()
                completion(true)
            case .failure(let authenticationError):
                incorrectAttempts += 1
                error = authenticationError
                
                if incorrectAttempts >= 3 {
                    blockInputForThirtySeconds()
                }
                completion(false)
            }
        }
    }
    private func resetAttempts() {
        incorrectAttempts = 0
        isInputBlocked = false
        blockExpirationTime = nil
    }
    
    private func blockInputForThirtySeconds() {
        isInputBlocked = true
        blockExpirationTime = Date().addingTimeInterval(30)
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) { [weak self] in
            self?.resetAttempts()
        }
    }
}
