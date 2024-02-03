//
//  Gliding_In_FlightApp.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/21/24.
//

import SwiftUI
import CoreLocation

@available(iOS 17.0, *)
@main
struct Gliding_In_FlightApp: App {
    
    let persistenceController = PersistenceController.shared
    
    @StateObject var gliderStore = GliderStore()
    
    
    // FIGURE OUT HOW TO RENDER BASED ON PROPER LOCATION AUTHORIZATION
    var body: some Scene {
        WindowGroup {
            RequestLocationView()
                .environmentObject(gliderStore)
        }
    }
}
