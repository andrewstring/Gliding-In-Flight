//
//  Location.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/31/24.
//

import Foundation

struct Location: Codable {
    let latitude: Double
    let longitude: Double
    let altitude: Double?
    let absoluteAltitude: Double?
    let relativeAltitude: Double?
    let speed: Double?
}

struct LocationResponse: Decodable {
    let message: String
    let data: Location?
}

//struct LocationEncodable: Encodable {
//    let latitude: Double
//    let longitude: Double
//    let altitude: Double?
//    let absoluteAltitude: Double?
//    let relativeAltitude: Double?
//    let speed: Double?
//}
//
//struct LocationDecodable: Decodable {
//    let latitude: Double
//    let longitude: Double
//    let altitude: Double?
//    let absoluteAltitude: Double?
//    let relativeAltitude: Double?
//    let speed: Double?
//}
