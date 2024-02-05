//
//  Button-Submit.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct ButtonSubmit: View {
//    var onClick: ((Any) -> Void)?
    var onClick: () -> Void
    var text: String
    
    var body: some View {
        
//        var button: Button<Text>
//        if let unwrappedOnClick = onClick {
//            button = Button(action: unwrappedOnClick) {
//                Text(text)
//            }
//        } else {
//            button = Button(action: { return }) {
//                Text(text)
//            }
//        }
        
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
