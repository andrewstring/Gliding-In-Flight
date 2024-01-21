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
    
    init(activityType: CLActivityType) {
        locationManager = CLLocationManager()
        locationManager.activityType = activityType
        locationDelegate = LocationDelegate()
        locationManager.delegate = locationDelegate
    }
}

class LocationDelegate: NSObject, CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ locationManager: CLLocationManager) {
        switch self.locationManager.authorizationStatus {
        case .notDetermined:
            <#code#>
        case .restricted:
            <#code#>
        case .denied:
            <#code#>
        case .authorizedAlways:
            <#code#>
        @unknown default:
            <#code#>
        }
    }
}
