//
//  InitView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct RequestLocationView: View {
    @StateObject var locationSetup: LocationSetup = LocationSetup(activityType: .automotiveNavigation)
    
    var body: some View {
        switch locationSetup.locationAuthorizationStatus {
            case .authorizedAlways:
                LoginView()
                .environmentObject(locationSetup)
            case .authorizedWhenInUse:
                InvalidLocationView(message: "Location recording is currently authorized for when in use only. Please authorize location recording for always and restart application")
                .environmentObject(locationSetup)
            case .denied:
                InvalidLocationView(message: "Location recording is currently denied. Please authorize location recording for always and restart application")
                .environmentObject(locationSetup)
            case .restricted:
                InvalidLocationView(message: "Location recording is currently restricted. Please authorize location recording for always and restart application")
                .environmentObject(locationSetup)
            case .notDetermined:
                InvalidLocationView(message: "Location recording has not been determined. Please authorize location recording for always and restart application")
                .environmentObject(locationSetup)
            default:
                InvalidLocationView(message: "Error")
        }
    }
}

#Preview {
    RequestLocationView()
}
