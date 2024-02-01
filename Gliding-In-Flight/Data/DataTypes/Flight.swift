//
//  Flight.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation

struct FlightEncodable: Encodable {
    let id: String
    let glider: GliderEncodable
    let dateOfFlight: String
    let locations: [LocationEncodable]
}

struct FlightDecodable: Decodable {
    let id: String
    let glider: GliderDecodable
    let dateOfFlight: String
    let locations: [LocationDecodable]
}
