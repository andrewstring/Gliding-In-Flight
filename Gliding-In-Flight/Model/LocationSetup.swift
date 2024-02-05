//
//  LocationManager.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import Foundation
import CoreLocation

class LocationSetup: NSObject, ObservableObject {
    
    // Published variable declarations
    @Published var locationAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var currentLocation: CLLocation?
    @Published var barometricAltitude: BarometricAltitude?
    
    // Location Manager declaration
    var locationManager: CLLocationManager
    typealias CLLocationAccuracy = Double
    
    init(activityType: CLActivityType) {
        // Set location manager and location manager configuration
        self.locationManager = CLLocationManager()
        self.locationManager.activityType = activityType
        
        super.init()
        
        self.locationManager.delegate = self
    }
}

extension LocationSetup: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        /* Request always authorization for any situation in which
         user has not enabled this feature */
        self.locationAuthorizationStatus = manager.authorizationStatus
        if (manager.authorizationStatus != .authorizedAlways) {
            manager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("UpdatedLocation")
        self.currentLocation = self.getLatestLocation(locations)
    }
    
    func getLatestLocation(_ locations: [CLLocation]) -> CLLocation? {
        if locations.count == 0 {
            return nil
        }
        
        let previousLocation = self.currentLocation
        let newLocation = locations[locations.count-1]
        
        return locations[locations.count-1]
    }
}
