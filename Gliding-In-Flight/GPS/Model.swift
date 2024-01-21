//
//  Model.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/21/24.
//

import Foundation
import CoreLocation


class GPSModel {
    typealias CLLocationAccuracy = Double
    let locationManager: CLLocationManager
    let locationDelegate: LocationDelegate
    var properAuthorization: Bool
    
    init(activityType: CLActivityType) {
        properAuthorization = false
        self.locationDelegate = LocationDelegate()
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self.locationDelegate
        self.locationManager.activityType = activityType
    }
}

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ locationManager: CLLocationManager) {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            /* WhenInUse Authorization will not allow app to
             update location when operating in background */
            locationManager.requestAlwaysAuthorization()
        case .restricted:
            locationManager.requestAlwaysAuthorization()
        case .denied:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways:
            print("Correct Authorization")
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            print("other")
        }
    }
}
