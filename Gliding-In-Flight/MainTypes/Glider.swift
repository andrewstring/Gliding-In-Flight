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
    
    init(id: String, name: String, currentLocation: Location? = nil, currentUpdate: String? = nil, lastLocation: Location? = nil, lastUpdate: String? = nil) {
        self.id = id
        self.name = name
        self.currentLocation = currentLocation
        self.currentUpdate = currentUpdate
        self.lastLocation = lastLocation
        self.lastUpdate = lastUpdate
    }
}

struct GliderResponse: Decodable {
    let message: String
    let data: Glider?
}
