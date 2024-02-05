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
    
    @Published var currentLocation: CLLocation?
    
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
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("UpdatedLocation")
        self.currentLocation = self.getLatestLocation(locations)
    }
    
    func getLatestLocation(_ locations: [CLLocation]) -> CLLocation? {
        if locations.count == 0 {
            return nil
        }
        return locations[locations.count-1]
    }
}
