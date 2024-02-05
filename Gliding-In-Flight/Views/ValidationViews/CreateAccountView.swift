//
//  CreateAccountView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct CreateAccountView: View {
    @EnvironmentObject private var gliderStore: GliderStore
    @State var id: String = ""
    @State var name: String = ""
    
    private let createAccountButtonText = "CREATE ACCOUNT"
    func createAccountButtonAction() {
        
        // ***PUSH TO DATABASE***
        // ALSO CHECK IF ALREADY EXISTS IN DATABASE
        
        let glider = Glider(id: id, name: name, currentLocation: nil, currentUpdate: nil, lastLocation: nil, lastUpdate: nil)
        Task {
            try await gliderStore.gliderSave(glider: glider)
        }
    }
    
    var body: some View {
        if gliderStore.glider != nil {
            if #available(iOS 17.0, *) {
                GlidingMapView()
            } else {
                // Fallback on earlier versions
            }
        }
        VStack {
            TextTitle(text: "Please create new account credentials and submit to create an account")
            
            TextFieldInput(placeholder: "Username", text: $id)
            TextFieldInput(placeholder: "Name", text: $name)
            
            ButtonSubmit(onClick: createAccountButtonAction, text: createAccountButtonText)
        }
        .multilineTextAlignment(.center)
    }
}

//#Preview {
//    CreateAccountView()
//}
