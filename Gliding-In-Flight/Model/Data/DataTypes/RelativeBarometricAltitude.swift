//
//  RelativeBarometricAltitude.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/12/24.
//

import Foundation

struct RelativeBarometricAltitude: Codable {
    var date: String
    var relativeAltitude: Double?
    var relativePressure: Double?
}

struct RelativeBarometricAltitudeResponse: Decodable {
    let message: String
    let data: RelativeBarometricAltitude?
}
