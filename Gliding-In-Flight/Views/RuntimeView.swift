//
//  StartingView.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/24/24.
//

import SwiftUI
import CoreLocation

struct RuntimeView: View {
    
    @State var gps: GPSModel
    init() {
        gps = GPSModel(activityType: .fitness)
    }
    @ViewBuilder
    var body: some View {
        if gps.locationManager.authorizationStatus == CLAuthorizationStatus.authorizedAlways {
            TESTER(gps: $gps)
//            RuntimeMap(gps: $gps)
        } else {
            EnableLocation()
        }
    }
}

#Preview {
    RuntimeView()
}
