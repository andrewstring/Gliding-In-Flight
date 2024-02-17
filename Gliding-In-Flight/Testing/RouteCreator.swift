//
//  RouteCreator.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/16/24.
//

import Foundation


struct RouteCreator {
    static func TESTINGCreateRoute(navModel: NavigationModel) {
        for location in Self.locationsToAdd {
            Task {
                try await navModel.addNewLocationToFlight(newLocation: location)
            }
        }
    }
    
    static var locationsToAdd: [Location] = [
        Location(
            date: "___",
            latitude: -113.072036,
            longitude: 42.857467,
            altitude: 10.0,
            speed: 10.0
        ),
        Location(
            date: "___",
            latitude: -110.208836,
            longitude: 46.930345,
            altitude: 10.0,
            speed: 10.0
        ),
        Location(
            date: "___",
            latitude: -105.096163,
            longitude: 48.132830,
            altitude: 10.0,
            speed: 10.0
        ),
        Location(
            date: "___",
            latitude: -102.041016,
            longitude: 47.179358,
            altitude: 10.0,
            speed: 10.0
        ),
    ]
    
}
