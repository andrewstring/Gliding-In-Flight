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
