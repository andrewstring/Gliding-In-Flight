//
//  NavButton.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI

@MainActor
struct RouteStartStopView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    @EnvironmentObject var gliderStore: GliderStore
    
    var flightStore = FlightStore()
    
    func startRoute() {
        guard let glider = gliderStore.glider else { return }
        navigationModel.startNavigation(glider: glider)
    }
    
    func stopRoute() {
        Task {
            await navigationModel.stopNavigation()
        }
    }
    
    func sendRoute() {
        Task {
            try await self.flightStore.flightsLoad()
            print("Flight OUTPUT")
            print(self.flightStore.flight)
        }
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
                self.startStopButton( "Send\nFlight", action: self.sendRoute)
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
