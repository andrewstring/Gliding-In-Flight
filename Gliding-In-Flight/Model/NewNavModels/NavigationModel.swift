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

@MainActor
class NavigationModel: ObservableObject {
    @Published var mapState: MapState = .preFlight
    @Published var flight: Flight? = nil
    @Published var flightStore: FlightStore = FlightStore()
    @Published var locationModel: LocationModel = LocationModel(activityType: .automotiveNavigation)
    @Published var barometricModel: BarometricModel = BarometricModel()
    @Published var gliderStore: GliderStore = GliderStore()
    
    init() {
        initModels()
    }
    
    func initModels() {
        self.locationModel.navigationModel = self
        self.barometricModel.navigationModel = self
    }
    
    func createFlight(glider: Glider) {
        print("CREATTEFLIGHT")
        self.flight = Flight(
            id: UUID().uuidString,
            name: "",
            glider: glider,
            dateOfFlight: DateTime.getDateTime().toString(),
            locations: [],
            absoluteBarometricAltitudes: [],
            relativeBarometricAltitudes: []
        )
    }
    
    func addNewLocationToFlight(newLocation: Location) {
        print(self.mapState)
        if self.mapState == .inFlight {
            guard let flight = self.flight else { return }
            flight.locations.append(newLocation)
            Task {
                try await flightStore.flightSave(flight: flight)
            }
        }
    }
    
    func startNavigation(glider: Glider) {
        self.mapState = MapState.inFlight
        self.createFlight(glider: glider)
    }
    
    func stopNavigation() async {
        do {
            self.mapState = MapState.postFlight
            guard let flightUnwrapped = self.flight else { print("Issue unwrapping flight"); return }
            try await self.flightStore.flightSave(flight: flightUnwrapped)
        } catch {
            print("stopNavigation errored out")
        }
    }
}
