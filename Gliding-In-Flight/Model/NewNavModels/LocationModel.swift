//
//  File.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/9/24.
//

import Foundation
import CoreLocation

class LocationModel: NSObject, ObservableObject {
    
    // Published Variable Declarations
    @Published var locationAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var previousLocation: CLLocation? = nil
    @Published var newLocation: CLLocation? = nil
    
    var navigationModel: NavigationModel?
    
    // Location Manager Declaration
    typealias CLLocationAccuracy = Double
    var locationManager: CLLocationManager
    
    init(activityType: CLActivityType) {
        // Set Location Manager and Location Manager Configuration
        self.locationManager = CLLocationManager()
        self.locationManager.activityType = activityType
        
        super.init()
        
        self.locationManager.delegate = self
        // self.flight = navigationModel.self
    }
}

// Delegate for LocationModel
extension LocationModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization() {
        self.locationAuthorizationStatus = self.locationManager.authorizationStatus
        if(self.locationAuthorizationStatus != .authorizedAlways) {
            self.locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Updated Location")
        self.previousLocation = self.newLocation
        self.newLocation = self.getLatestLocation(locations)
        
        guard let location = self.newLocation else { print("Issue with new location"); return }
        guard let navModel = self.navigationModel else { print("Issue with navigation model"); return }
        
        let newLocation = Location(
            date: DateTime.getDateTime().toString(),
            latitude: location.coordinate.latitude,
            longitude: location.coordinate.longitude,
            altitude: location.altitude,
            absoluteAltitude: nil,
            relativeAltitude: nil,
            speed: location.speed
        )
        navModel.addNewLocationToFlight(newLocation: newLocation)
    }
    
    func getLatestLocation(_ locations: [CLLocation]) -> CLLocation? {
        if locations.count == 0 {
            return nil
        }
        return locations[locations.count - 1]
    }
}
