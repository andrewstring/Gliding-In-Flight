//
//  InitView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import SwiftUI

struct InitView: View {
    @StateObject var locationSetup: LocationSetup = LocationSetup(activityType: .automotiveNavigation)
    
    var body: some View {
        if (locationSetup.locationAuthorizationStatus != .authorizedAlways) {
           NoLocationView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    InitView()
}
