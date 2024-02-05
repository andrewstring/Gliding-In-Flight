//
//  NavButton.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI

struct RouteStartStopView: View {
    
    func startRoute() {
        print("Start")
    }
    
    func stopRoute() {
        print("Stop")
    }
    
    func startStopButton(_ text: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(text)
        }
        .padding()
        .foregroundColor(.white)
        .background(Color(.gray))
        .cornerRadius(10.0)
    }
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                self.startStopButton( "Start\nFlight", action: {print("JKL")})
                Spacer()
                self.startStopButton("Stop\nFlight", action: {print("JKL")})
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
        }
        .frame(height: 90)
    }
}

#Preview {
    RouteStartStopView()
}
