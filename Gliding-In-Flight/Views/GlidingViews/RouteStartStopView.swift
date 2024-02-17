//
//  NavButton.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI

struct RouteStartStopView: View {
    
//    @EnvironmentObject var model: Model
    @EnvironmentObject var navigationModel: NavigationModel
    
    var flightStore = FlightStore()
    
    func startRoute() {
        guard let glider = navigationModel.gliderStore.glider else { return }
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
            guard let unwrappedFlight = self.navigationModel.flight else { return }
            APIFlight.addFlight(flightData: unwrappedFlight)
        }
    }
    
    func restartRoute() {
        navigationModel.mapState = .preFlight
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
                switch self.navigationModel.mapState {
                case .preFlight:
                    self.startStopButton("Start\nFlight", action: self.startRoute)
                case .inFlight:
                    self.startStopButton("Stop\nFlight", action: self.stopRoute)
                case .postFlight:
                    self.startStopButton("Send\nFlight", action: self.sendRoute)
                    Spacer()
                    self.startStopButton("Restart\nFlight", action: self.restartRoute)
                }
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
