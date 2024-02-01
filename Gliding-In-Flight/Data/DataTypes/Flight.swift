//
//  Flight.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation

struct Flight {
    let id: String
    let glider: Glider
    let dateOfFlight: String
    let locations: [Location?]
}

struct FlightEncodable: Encodable {
    let id: String
    let glider: GliderEncodable
    let dateOfFlight: String
    let locations: [LocationEncodable?]
}

struct FlightDecodable: Decodable {
    let id: String
    let glider: GliderDecodable
    let dateOfFlight: String
    let locations: [LocationDecodable?]
}
