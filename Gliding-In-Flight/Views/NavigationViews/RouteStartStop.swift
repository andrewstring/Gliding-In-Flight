//
//  NavButton.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI

struct RouteStartStop: View {
    
    func startRoute() {
        print("Starting Route")
    }
    
    func stopRoute() {
        print("Stopping Route")
    }
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button("JKL", action: startRoute)
                Button("LLLL", action: stopRoute)
            }
            .frame(maxWidth: .infinity)
            .background(Color(.blue))
        }
    }
}

#Preview {
    RouteStartStop()
}
