//
//  TextFieldInput.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct TextFieldInput: View {
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .frame(height: 40)
            .cornerRadius(30)
            .padding(.horizontal)
            .padding(.top)
    }
}

//#Preview {
//    TextFieldInput()
//}
