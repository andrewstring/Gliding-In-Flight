//
//  PressureAltitudes.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/9/24.
//

import Foundation
import CoreMotion

struct AbsoluteBarometricAltitude: Codable {
    var date: String
    var absoluteAltitude: Double?
    var absoluteAccuracy: Double?
    var absolutePrecision: Double?
}

struct AbsoluteBarometricAltitudeResponse: Decodable {
    let message: String
    let data: AbsoluteBarometricAltitude?
}
