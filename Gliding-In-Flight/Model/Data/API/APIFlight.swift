//
//  Flight.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/29/24.
//

import Foundation

struct APIFlight {
    static func getFlight(flightId: String) {
//        APIBase.getRequest(path: "/glider-tracking/flight?id=\(flightId)")
    }
    
    static func addFlight() {
//        APIBase.postRequest(path: "/glider-tracking/flight")
        APIBase.postRequest(path: "/glider-tracking/flight", responseType: FlightResponse.self, requestData: Flight.self as! Encodable)
    }
    
    static func updateFlight() {
//        APIBase.updateRequest(path: "/glider-tracking/flight")
        
    }
    
    static func deleteFlight() {
//        APIBase.updateRequest(path: "/glider-tracking/flight")
        
    }
    
}
