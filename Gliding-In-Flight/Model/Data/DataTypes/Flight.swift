//
//  Flight.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation

class Flight: Codable {
    let id: String
    let name: String
    let glider: Glider
    let dateOfFlight: String
    var locations: [Location]
    var barometricAltitudes: [BarometricAltitude]
    
    init(id: String, name: String, glider: Glider, dateOfFlight: String,
         locations: [Location], barometricAltitudes: [BarometricAltitude]) {
        self.id = id
        self.name = name
        self.glider = glider
        self.dateOfFlight = dateOfFlight
        self.locations = locations
        self.barometricAltitudes = barometricAltitudes
    }
}

struct FlightResponse: Decodable {
    let message: String
    let data: Flight?
}
