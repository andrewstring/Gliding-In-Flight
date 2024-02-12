//
//  PressureAltitudes.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/9/24.
//

import Foundation
import CoreMotion

struct AbsoluteBarometricAltitude: Codable {
    // Absolute Altitude Data
    var absoluteAltitude: Double?
    var absoluteAccuracy: Double?
    var absolutePrecision: Double?
    
    // Relative Altitude Data
    var relativeAltitude: Double?
    var reltivePressure: Double?
}

struct BarometricAltitudeResponse: Decodable {
    let message: String
    let data: AbsoluteBarometricAltitude?
}
