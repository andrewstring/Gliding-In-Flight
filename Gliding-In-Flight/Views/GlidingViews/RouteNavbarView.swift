//
//  RouteNavbarView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI

struct RouteNavbarView: View {
    var body: some View {
            HStack {
                Spacer()
                Text("Overview: Output Metrics")
                    .padding()
                Spacer()
            }
            .frame(height: 70)
            .foregroundColor(.white)
    }
}

#Preview {
    RouteNavbarView()
        .background(Color(.lightGray))
}
