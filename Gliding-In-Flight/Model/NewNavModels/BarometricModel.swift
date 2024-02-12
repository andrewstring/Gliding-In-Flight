//
//  BarometricModel.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/12/24.
//

import Foundation
import CoreMotion

@MainActor
class BarometricModel: ObservableObject {
    @Published var absoluteAltitude: Double?
    @Published var absoluteAccuracy: Double?
    @Published var absolutePrecision: Double?
    @Published var relativeAltitude: Double?
    @Published var relativePressure: Double?
    
    var navigationModel: NavigationModel?
    
    let operationQueue: OperationQueue
    let altimeter: CMAltimeter
    
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
            print("handleAbsoluteAltitudeUpdate error")
            print(error.localizedDescription)
            return
        }
        self.absoluteAltitude = absoluteAltitudeData?.altitude
        self.absoluteAccuracy = absoluteAltitudeData?.accuracy
        self.absolutePrecision = absoluteAltitudeData?.precision
        self.navigationModel?.flight?.absoluteBarometricAltitudes.append(AbsoluteBarometricAltitude(date: DateTime.getDateTime().toString(), absoluteAltitude: self.absoluteAltitude, absoluteAccuracy: self.absoluteAccuracy, absolutePrecision: self.absolutePrecision))
    }
    
    func startRelativeAltitudeRecording() {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            self.altimeter.startRelativeAltitudeUpdates(to: self.operationQueue, withHandler: handleRelativeAltitudeUpdate)
        }
    }
    func handleRelativeAltitudeUpdate(_ altitudeData: CMAltitudeData?, _ errorOpt: (any Error)?) {
        if let error = errorOpt {
            print("handleRelativeAltitudeUpdate error")
            print(error.localizedDescription)
            return
        }
        self.relativeAltitude = altitudeData?.relativeAltitude.doubleValue
        self.relativePressure = altitudeData?.pressure.doubleValue
        self.navigationModel?.flight?.relativeBarometricAltitudes.append(RelativeBarometricAltitude(date: DateTime.getDateTime().toString(), relativeAltitude: self.relativeAltitude, relativePressure: self.relativePressure))
    }
}
