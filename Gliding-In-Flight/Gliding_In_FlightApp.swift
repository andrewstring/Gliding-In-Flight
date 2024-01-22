//
//  Gliding_In_FlightApp.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/21/24.
//

import SwiftUI
import CoreLocation


@main
struct Gliding_In_FlightApp: App {
    
    let persistenceController = PersistenceController.shared
    
    let gps: GPSModel
    
    init() {
        self.gps = GPSModel(activityType: .fitness)
    }
        
        
    // FIGURE OUT HOW TO RENDER BASED ON PROPER LOCATION AUTHORIZATION
    var body: some Scene {
        WindowGroup {
            switch gps.locationManager.authorizationStatus {
                case.authorizedAlways:
                    MapView()
                default:
                    EnableLocation()
            }
        }
    }
}
