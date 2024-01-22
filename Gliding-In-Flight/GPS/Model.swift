//
//  Model.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/21/24.
//

import SwiftUI
import CoreLocation


class GPSModel: ObservableObject {
    
    typealias CLLocationAccuracy = Double
    let locationManager: CLLocationManager
    let locationDelegate: LocationDelegate

    
    init(activityType: CLActivityType) {
        self.locationDelegate = LocationDelegate()
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self.locationDelegate
        self.locationManager.activityType = activityType
    }
}

class LocationDelegate: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    func locationManagerDidChangeAuthorization(_ locationManager: CLLocationManager) {
        switch locationManager.authorizationStatus {
            case .authorizedAlways:
                print("good")
            default:
                locationManager.requestAlwaysAuthorization()
        }
    }
}
