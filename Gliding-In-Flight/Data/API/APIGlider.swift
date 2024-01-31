//
//  Glider.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/29/24.
//

import Foundation


struct APIGlider {
    static let gliderRoute = "/glider-tracking/glider"
    
    static func getGlider(gliderId: String) {
        APIBase.getRequest(path: "\(gliderRoute)?id=\(gliderId)")
        print("GET")
    }
    
    static func addGlider(num: String) {
//        APIBase.postRequest(path: "/glider-tracking/glider")
        let testGlider: Glider = Glider(
            id: "test\(num)",
            name: "test\(num)",
            location: ["test\(num)":1.0],
            lastUpdate: DateTime.getDateTime().toString(),
            previousAltitude: 1.0,
            altitude: 1.0,
            absoluteAltitude: 1.0,
            relativeAltitude: 1.0,
            speed: 1.0
        )
        APIBase.postRequest(path: "\(gliderRoute)", data: testGlider)
    }
    
    static func updateGlider() {
        
    }
    
    static func deleteGlider() {
        
    }
}
