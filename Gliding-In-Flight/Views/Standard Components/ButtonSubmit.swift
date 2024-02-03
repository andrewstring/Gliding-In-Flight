//
//  Button-Submit.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct ButtonSubmit: View {
    var onClick: () -> Void
    var text: String
    
    var body: some View {
        Button(action: onClick) {
            Text(text)
        }
        .padding()
        .frame(height: 50)
    }
}

//#Preview {
//    ButtonSubmit()
//}
