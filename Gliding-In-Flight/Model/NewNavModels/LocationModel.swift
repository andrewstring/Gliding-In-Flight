//
//  File.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/9/24.
//

import Foundation
import CoreLocation

@MainActor
class LocationModel: NSObject, ObservableObject {
    
    // Published Variable Declarations
    @Published var locationAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var currentLocation: CLLocation? = nil
    
    var navigationModel: NavigationModel?
    
    // Location Manager Declaration
    typealias CLLocationAccuracy = Double
    var locationManager: CLLocationManager? = nil
    
    init(activityType: CLActivityType) {
        // Set Location Manager and Location Manager Configuration
        self.locationManager = CLLocationManager()
        self.locationManager?.activityType = activityType
        
        super.init()
        
        self.locationManager?.delegate = self
        self.locationManager?.startUpdatingLocation()
    }
}

// Delegate for LocationModel
extension LocationModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard let locationManagerUnwrapped = locationManager else { return }
        self.locationAuthorizationStatus = locationManagerUnwrapped.authorizationStatus
        if(self.locationAuthorizationStatus != .authorizedAlways) {
            self.locationManager?.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let navModel = self.navigationModel else { print("Issue with navigation model"); return }
        
        
        guard let latestLocation = self.getLatestLocation(locations) else { return }
        self.currentLocation = latestLocation
        
        
        if navModel.mapState != .inFlight { return }
        guard let unwrappedCurrentLocation = self.currentLocation else { return }
        if !isSignificantDistance(from: unwrappedCurrentLocation, to: latestLocation, threshold: 10.0) {
            return
        }
        
        let newLocation = Location(
            date: DateTime.getDateTime().toString(),
            latitude: unwrappedCurrentLocation.coordinate.latitude,
            longitude: unwrappedCurrentLocation.coordinate.longitude,
            altitude: unwrappedCurrentLocation.altitude,
            speed: unwrappedCurrentLocation.speed
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

// Helper Functions for Location Management
extension LocationModel {
    func isSignificantDistance(from: CLLocation, to: CLLocation, threshold: CLLocationDistance) -> Bool {
        let distance = to.distance(from: from)
        return distance > threshold
    }
}
