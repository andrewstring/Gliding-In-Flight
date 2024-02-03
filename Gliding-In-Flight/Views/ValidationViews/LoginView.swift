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
        print("Sign In Button Action")
        // Need to implement database fetch
    }
    private let createAccountButtonText = "CREATE ACCOUNT"
    func createAccountButtonAction() {
        print("Creating account")
    }
    
    
    var body: some View {
        if let unwrappedGlider = gliderStore.glider {
            MapView()
        } else {
            NavigationStack {
                VStack {
                    TextTitle(text: "Welcome!\n Please enter your login below")
                    TextFieldInput(placeholder: "Username", text: $username)
                    ButtonSubmit(onClick: signInButtonAction, text: signInButtonText)
                    NavigationLink {
                        CreateAccountView()
                    } label: {
                        Text("CREATE ACCOUNT")
                    }
                }
                .multilineTextAlignment(.center)
            }
        }
    }
}

#Preview {
    LoginView()
}
