//
//  LocationManager.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import Foundation
import CoreLocation

class LocationSetup: NSObject, ObservableObject {
    @Published var locationAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    
    typealias CLLocationAccuracy = Double
    var locationManager: CLLocationManager
    
    init(activityType: CLActivityType) {
        self.locationManager = CLLocationManager()
        self.locationManager.activityType = activityType
        
        super.init()
        self.locationManager.delegate = self
    }
}

extension LocationSetup: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        self.locationAuthorizationStatus = manager.authorizationStatus
        if (manager.authorizationStatus != .authorizedAlways) {
            manager.requestAlwaysAuthorization()
        }
    }
}
