//
//  ThermalAnnotation.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/15/24.
//

import Foundation
import MapKit

class ThermalAnnotation: MKPointAnnotation {
    let id: String
    
    init(thermal: Thermal) {
        self.id = thermal.id
        super.init()
        self.coordinate = thermal.coordinate
    }
}
