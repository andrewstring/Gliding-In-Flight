//
//  Glider.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation


struct Glider: Codable {
    let id: String
    let name: String
    let currentLocation: Location?
    let currentUpdate: String?
    let lastLocation: Location?
    let lastUpdate: String?
}

struct GliderResponse: Decodable {
    let message: String
    let data: Glider?
}

//struct GliderEncodable: Encodable {
//    let id: String
//    let name: String
//    let currentLocation: LocationEncodable?
//    let currentUpdate: String?
//    let lastLocation: LocationEncodable?
//    let lastUpdate: String?
//}
//
//
//struct GliderDecodable: Decodable {
//    let id: String
//    let name: String
//    let currentLocation: LocationDecodable?
//    let currentUpdate: String?
//    let lastLocation: LocationDecodable?
//    let lastUpdate: String?
//}
//
//struct GliderResponse: Decodable {
//    let message: String
//    let data: GliderDecodable?
//}
