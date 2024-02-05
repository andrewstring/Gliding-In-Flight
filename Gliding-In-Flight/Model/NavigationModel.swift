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
    
    var flight: Flight?
    
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
        print("STARTED NAVBIGATION")
        print(self.flight)
    }
    
    
    
    func stopNavigation() {
        self.mapState = MapState.postFlight
    }
}
