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
    
    let flightStore: FlightStore
    var locationModel: LocationModel
    var barometricModel: BarometricModel
    
    init() {
        self.mapState = .preFlight
        self.flightStore = FlightStore()
        self.barometricModel = BarometricModel()
        self.locationModel = LocationModel(activityType: .automotiveNavigation)
        initModels()
    }
    
    func initModels() {
        self.locationModel.navigationModel = self
        self.barometricModel.navigationModel = self
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
        self.locationModel = LocationModel(activityType: .automotiveNavigation)
        self.barometricModel = BarometricModel()
        self.mapState = MapState.inFlight
        self.createFlight(glider: glider)
        print("FLIGHT")
        print(self.flight)
    }
    
    func stopNavigation() async {
        do {
            self.mapState = MapState.postFlight
            guard let flightUnwrapped = self.flight else { print("Issue unwrapping flight"); return }
            try await self.flightStore.flightSave(flight: flightUnwrapped)
            flight?.name = UUID().uuidString
        } catch {
            print("stopNavigation errored out")
        }
    }
}
