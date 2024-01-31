//
//  Glider.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/29/24.
//

import Foundation


struct APIGlider {
    static func getGlider(gliderId: String) {
        APIBase.getRequest(path: "/glider-tracking/glider?id=\(gliderId)")
    }
    
    static func addGlider() {
        
    }
    
    static func updateGlider() {
        
    }
    
    static func deleteGlider() {
        
    }
}
