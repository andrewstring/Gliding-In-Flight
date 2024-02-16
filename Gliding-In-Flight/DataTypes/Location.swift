//
//  Location.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/31/24.
//

import Foundation

struct Location: Codable {
    let date: String
    let latitude: Double
    let longitude: Double
    let altitude: Double?
    let speed: Double?
    
    init(date: String, latitude: Double, longitude: Double, altitude: Double? = nil, speed: Double? = nil) {
        self.date = date
        self.latitude = latitude
        self.longitude = longitude
        self.altitude = altitude
        self.speed = speed
    }
}

struct LocationResponse: Decodable {
    let message: String
    let data: Location?
}
