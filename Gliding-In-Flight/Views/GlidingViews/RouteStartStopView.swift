//
//  NavButton.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI

struct RouteStartStopView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    @EnvironmentObject var gliderStore: GliderStore
    
    func startRoute() {
        guard let glider = gliderStore.glider else { return }
        navigationModel.startNavigation(glider: glider)
    }
    
    func stopRoute() {
        navigationModel.stopNavigation()
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
                self.startStopButton( "Start\nFlight", action: self.startRoute)
                Spacer()
                self.startStopButton("Stop\nFlight", action: self.stopRoute)
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
