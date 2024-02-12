//
//  NavButton.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI

@MainActor
struct RouteStartStopView: View {
    
    @EnvironmentObject var model: Model
    
    var flightStore = FlightStore()
    
    func startRoute() {
        guard let glider = model.gliderStore.glider else { return }
        model.navigationModel.startNavigation(glider: glider)
    }
    
    func stopRoute() {
        Task {
            await model.navigationModel.stopNavigation()
        }
    }
    
    func sendRoute() {
        Task {
            try await self.flightStore.flightsLoad()
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
