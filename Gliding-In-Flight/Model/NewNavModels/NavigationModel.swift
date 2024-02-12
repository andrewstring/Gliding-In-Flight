//
//  NavigationModelNew.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/12/24.
//

import Foundation

enum MapState {
    case preFlight
    case inFlight
    case postFlight
}

class NavigationModel: ObservableObject {
    @Published var mapState: MapState
    @Published var flight: Flight? = nil
    
    let flightStore = FlightStore()
    let locationModel: LocationModel
    let barometricModel: BarometricModel
    
    init() {
        self.mapState = .preFlight
        self.locationModel = LocationModel(activityType: .automotiveNavigation)
        self.barometricModel = BarometricModel()
    }
    
    func createFlight(glider: Glider) {
        self.flight = Flight(
            id: UUID().uuidString,
            name: "",
            glider: glider,
            dateOfFlight: DateTime.getDateTime().toString(),
            locations: [],
            barometricAltitudes: []
        )
    }
    
    func addNewLocationToFlight(newLocation: Location) {
        self.flight?.locations.append(newLocation)
    }
    
    func startNavigation(glider: Glider) {
        self.mapState = MapState.inFlight
        self.createFlight(glider: glider)
        if self.flight != nil {
            locationModel.locationManager.startUpdatingLocation()
            barometricModel.startAbsoluteAltitudeRecording()
            barometricModel.startRelativeAltitudeRecording()
        }
    }
}
