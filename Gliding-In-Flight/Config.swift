//
//  Config.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/29/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Config {
    /*
     Server IP
    static let url: String = "http://192.168.200.119"
     */
    
    // Desktop IP
    static let url: String = "http://192.168.0.155"
    static let port: String = "3000"
    
    
    struct Colors {
        static let primary: Color = Color(red: 0.698, green: 0.8588, blue: 0.6784)
//        static let button: Color = Color()
    }
    
    struct Model {
        static let activityType: CLActivityType = .fitness
    }
}
