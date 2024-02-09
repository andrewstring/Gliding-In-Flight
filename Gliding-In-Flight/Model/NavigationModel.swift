//
//  NavigationModel.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import Foundation

enum MapState {
    case preFlight
    case inFlight
    case postFlight
}

class NavigationModel: ObservableObject {
    @Published var mapState: MapState
    let flightStore = FlightStore()
    
    var flight: Flight?
    var locationModel: LocationModel?
    
    init() {
        self.mapState = MapState.preFlight
        self.flight = nil
    }
    
    func createFlight(glider: Glider) {
        self.flight = Flight(id: UUID().uuidString,
                             name: "",
                             glider: glider,
                             dateOfFlight: DateTime.getDateTime().toString(),
                             locations: [])
    }
    
    func addNewLocationToFlight(newLocation: Location) {
        self.flight?.locations.append(newLocation)
    }
    
    func startNavigation(glider: Glider) {
        self.mapState = MapState.inFlight
        self.createFlight(glider: glider)
        if self.flight != nil {
            let navigationModel = LocationModel(activityType: .automotiveNavigation, flight: self.flight!, navigationModel: self)
        }
        print("STARTED NAVBIGATION")
    }
    
    
    
    func stopNavigation() async {
        do {
            self.mapState = MapState.postFlight
            guard let flightUnwrapped = self.flight else { return }
            try await self.flightStore.flightSave(flight: flightUnwrapped)
        } catch {
            print("ERRORED OUT")
        }
    }
}
