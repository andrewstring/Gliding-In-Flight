//
//  CreateAccountView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct CreateAccountView: View {
    @State var id: String
    @State var name: String
    
    private let createAccountButtonText = "CREATE ACCOUNT"
    func createAccountButtonAction() {
        print("Action")
    }
    
    var body: some View {
        TextTitle(text: "Please create new account credentials and submit to create an account")
        
        TextFieldInput(placeholder: "Username", text: $id)
        TextFieldInput(placeholder: "Name", text: $name)
        
        ButtonSubmit(onClick: createAccountButtonAction, text: createAccountButtonText)
    }
}

//#Preview {
//    CreateAccountView()
//}
