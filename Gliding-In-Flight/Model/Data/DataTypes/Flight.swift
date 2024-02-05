//
//  Flight.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation

struct Flight: Codable {
    let id: String
    let name: String
    let glider: Glider
    let dateOfFlight: String
    var locations: [Location?]
}

struct FlightResponse: Decodable {
    let message: String
    let data: Flight?
}



//struct FlightEncodable: Flight, Encodable {
//    let id: String
//    let glider: GliderEncodable
//    let dateOfFlight: String
//    let locations: [LocationEncodable?]
//}
//
//struct FlightDecodable: Decodable {
//    let id: String
//    let glider: GliderDecodable
//    let dateOfFlight: String
//    let locations: [LocationDecodable?]
//}
