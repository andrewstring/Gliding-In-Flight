//
//  Flight.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation

struct Flight: Encodable {
    let id: String
    let glider: Glider
    let dateOfFlight: Date
    let flightData: [String: Double]
}
