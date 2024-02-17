//
//  Thermal.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/30/24.
//

import Foundation
import CoreLocation

struct Thermal: Codable {
    let id: String
    let location: Location
    let glider: Glider
    let detectedOn: String
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    }
}

struct ThermalResponse: Decodable {
    let message: String
    let data: Thermal?
}
