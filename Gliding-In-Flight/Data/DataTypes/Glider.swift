//
//  Glider.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation


struct Glider: Encodable {
    let id: String
    let name: String
    let location: [String: Double]
    let lastUpdate: String
    let previousAltitude: Double
    let altitude: Double
    let absoluteAltitude: Double
    let relativeAltitude: Double
    let speed: Double
}
