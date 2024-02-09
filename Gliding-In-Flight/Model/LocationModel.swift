//
//  LocationManager.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/2/24.
//

import Foundation
import CoreLocation

class LocationModel: NSObject, ObservableObject {
    
    // Published variable declarations
    @Published var locationAuthorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var previousLocation: CLLocation?
    @Published var newLocation: CLLocation?
    private var flight: Flight?
    private var navigationModel: NavigationModel?
    
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
    init(activityType: CLActivityType, flight: Flight, navigationModel: NavigationModel) {
        // Set location manager and location manager configuration
        self.locationManager = CLLocationManager()
        self.locationManager.activityType = activityType
        
        super.init()
        
        self.locationManager.delegate = self
        self.flight = flight
        self.navigationModel = navigationModel
    }
}

extension LocationModel: CLLocationManagerDelegate {
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
        self.previousLocation = self.newLocation
        self.newLocation = self.getLatestLocation(locations)
        
        guard let flightUnwrapped = self.flight else { return }
        guard let navigationModelUnwrapped = self.navigationModel else { return }
        guard let newLocationUnwrapped = self.newLocation else { return }
        
        let location = Location(
            latitude: newLocationUnwrapped.coordinate.latitude,
            longitude: newLocationUnwrapped.coordinate.longitude,
            altitude: newLocationUnwrapped.altitude,
            absoluteAltitude: nil,
            relativeAltitude: nil,
            speed: newLocationUnwrapped.speed
        )
        
        navigationModelUnwrapped.addNewLocationToFlight(newLocation: location)
    }
    
    func getLatestLocation(_ locations: [CLLocation]) -> CLLocation? {
        if locations.count == 0 {
            return nil
        }
        return locations[locations.count-1]
    }
}
