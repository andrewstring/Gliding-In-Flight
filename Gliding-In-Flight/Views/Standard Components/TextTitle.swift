//
//  TextTitle.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct TextTitle: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.title)
            .padding()
    }
}

//#Preview {
//    TextTitle()
//}
