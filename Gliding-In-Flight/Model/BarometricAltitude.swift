//
//  BarometricAltitude.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import Foundation
import CoreMotion

struct BarometricAltitude {
    let altimeter: CMAltimeter
    
    init() {
        self.altimeter = CMAltimeter()
    }
}
