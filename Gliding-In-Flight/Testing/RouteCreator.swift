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
            latitude: 39.26,
            longitude: -84.33,
            altitude: 0.0,
            speed: 0.0
        ),
        Location(
            date: "___",
            latitude: 39.28,
            longitude: -84.28,
            altitude: 0.0,
            speed: 0.0
        ),
        Location(
            date: "___",
            latitude: 39.30,
            longitude: -84.26,
            altitude: 0.0,
            speed: 0.0
        ),
        Location(
            date: "___",
            latitude: 39.31,
            longitude: -84.22,
            altitude: 0.0,
            speed: 0.0
        )
    ]
    
}
