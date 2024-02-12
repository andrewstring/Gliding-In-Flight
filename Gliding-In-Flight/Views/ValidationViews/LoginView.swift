//
//  Login.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @EnvironmentObject var model: Model
    
    
    private let signInButtonText = "SIGN IN"
    func signInButtonAction() {
        print("Sign In Button Action")
    }
    private let createAccountButtonText = "CREATE ACCOUNT"
    func createAccountButtonAction() {
        print("Creating account")
    }
    
    
    var body: some View {
        if model.gliderStore.glider != nil {
            GlidingMapView()
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
