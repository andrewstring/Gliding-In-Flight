//
//  Login.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @EnvironmentObject private var gliderStore: GliderStore
    
    
    private let signInButtonText = "SIGN IN"
    func signInButtonAction() {
        print("USER STORE")
        print(username)
        print(gliderStore)
        print("Signing in")
    }
    private let createAccountButtonText = "CREATE ACCOUNT"
    func createAccountButtonAction() {
        print("Creating account")
    }
    
    
    var body: some View {
        VStack {
            TextTitle(text: "Welcome!\n Please enter your login below")
            TextFieldInput(placeholder: "Username", text: $username)
            ButtonSubmit(onClick: signInButtonAction, text: signInButtonText)
            ButtonSubmit(onClick: createAccountButtonAction, text: createAccountButtonText)
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    LoginView()
}
