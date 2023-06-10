//
//  LoginView.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

//MARK: - Login View
struct LoginView: View {
    // properties
    @StateObject private var loginViewModel = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            ScreenView()
                .ignoresSafeArea(edges: .bottom)
                .frame(height: 800)
            
            VStack {
                // TextField for authentication
                Grid {
                    TextField("Your login", text: $loginViewModel.user.login)
                        .keyboardType(.emailAddress)
                    Divider()
                    SecureField("Password", text: $loginViewModel.user.password)
                    Divider()
                }
                .colorMultiply(.black)
                Spacer()
                // check isInputBlocked
                if loginViewModel.isInputBlocked {
                    CountdownView(remainingBlockTime: Binding<TimeInterval?>(
                        get: { loginViewModel.remainingBlockTime },
                        set: { _ in }
                    ))
                    .padding()
                }
                if loginViewModel.showProgressView {
                    ProgressView()
                }
                // Log in button
                Button("Log in") {
                    loginViewModel.login { success in
                        authentication.updateValidation(success: success)
                    }
                }
                .foregroundColor(.black)
                .disabled(loginViewModel.loginDisabled)
                /// Tap
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            }
            .autocapitalization(.none)
            .font(.system(size: 20, weight: .medium, design: .monospaced))
            .offset(y: -250)
            .padding(.bottom, -150)
            .padding()
            .disabled(loginViewModel.showProgressView)
            .alert(item: $loginViewModel.error) { error in
                Alert(title: Text("Invlid Login"), message:
                        Text (error.localizedDescription))
            }
        }
    }
}
// MARK: - Login View Previews
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
