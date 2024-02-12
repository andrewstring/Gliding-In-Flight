//
//  InitView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct RequestLocationView: View {
    
    @EnvironmentObject var navigationModel: NavigationModel
    
    
    var body: some View {
        switch navigationModel.locationModel.locationAuthorizationStatus {
            case .authorizedAlways:
                LoginView()
            case .authorizedWhenInUse:
                InvalidLocationView(message: "Location recording is currently authorized for when in use only. Please authorize location recording for always and restart application")
            case .denied:
                InvalidLocationView(message: "Location recording is currently denied. Please authorize location recording for always and restart application")
            case .restricted:
                InvalidLocationView(message: "Location recording is currently restricted. Please authorize location recording for always and restart application")
            case .notDetermined:
                InvalidLocationView(message: "Location recording has not been determined. Please authorize location recording for always and restart application")
            default:
                InvalidLocationView(message: "Error")
        }
    }
}

#Preview {
    RequestLocationView()
}
