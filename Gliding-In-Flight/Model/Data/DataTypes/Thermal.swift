//
//  Thermal.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation

struct Thermal: Codable {
    let id: String
    let location: Location
    let glider: Glider
    let detectedOn: String
}

struct ThermalResponse: Decodable {
    let message: String
    let data: Thermal?
}
