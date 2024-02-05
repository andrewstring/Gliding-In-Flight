//
//  BarometricAltitude.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import Foundation
import CoreMotion

class BarometricModel: ObservableObject {
    let operationQueue: OperationQueue
    let altimeter: CMAltimeter
    @Published var absoluteAltitude: Double?
    @Published var relativeAltitude: Double?
    
    
    init() {
        self.operationQueue = OperationQueue()
        self.altimeter = CMAltimeter()
        self.startAbsoluteAltitudeRecording()
        self.startRelativeAltitudeRecording()
        
    }
    
    func startAbsoluteAltitudeRecording() {
        if CMAltimeter.isAbsoluteAltitudeAvailable() {
            self.altimeter.startAbsoluteAltitudeUpdates(to: self.operationQueue, withHandler: handleAbsoluteAltitudeUpdate)
            
        }
    }
    func handleAbsoluteAltitudeUpdate(_ absoluteAltitudeData: CMAbsoluteAltitudeData?, _ errorOpt: (any Error)?) {
        if let error = errorOpt {
            print("ERROR")
            print(error.localizedDescription)
            return
        }
        self.absoluteAltitude = absoluteAltitudeData?.altitude
    }
    
    func startRelativeAltitudeRecording() {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            self.altimeter.startRelativeAltitudeUpdates(to: self.operationQueue, withHandler: handleRelativeAltitudeUpdate)
        }
    }
    func handleRelativeAltitudeUpdate(_ altitudeData: CMAltitudeData?, _ errorOpt: (any Error)?) {
        if let error = errorOpt {
            print("ERROR")
            print(error.localizedDescription)
            return
        }
        self.relativeAltitude = altitudeData?.relativeAltitude as? Double
    }
}
