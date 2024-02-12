////
////  NavigationModel.swift
////  Gliding-In-Flight
////
////  Created by Andrew Stringfellow on 2/4/24.
////
//
//import Foundation
//
//enum MapStateOld {
//    case preFlight
//    case inFlight
//    case postFlight
//}
//
//class NavigationModelOld: ObservableObject {
//    @Published var mapState: MapStateOld
//    @Published var flight: Flight?
//    
//    let flightStore = FlightStore()
//    var locationModel: LocationModelOld
//    var barometricModel = BarometricModelOld()
//    
//    init() {
//        self.mapState = MapStateOld.preFlight
//        self.flight = nil
//        self.locationModel = LocationModelOld(activityType: .automotiveNavigation)
//    }
//    
//    func createFlight(glider: Glider) {
//        self.flight = Flight(id: UUID().uuidString,
//                             name: "",
//                             glider: glider,
//                             dateOfFlight: DateTime.getDateTime().toString(),
//                             locations: [])
//    }
//    
//    func addNewLocationToFlight(newLocation: Location) {
//        self.flight?.locations.append(newLocation)
//    }
//    
//    func startNavigation(glider: Glider) {
//        self.mapState = MapStateOld.inFlight
//        self.createFlight(glider: glider)
//        if self.flight != nil {
//            guard let unwrappedLocationModel = self.locationModel else { return }
//            unwrappedLocationModel.locationManager.startUpdatingLocation()
//            barometricModel.startAbsoluteAltitudeRecording()
//            barometricModel.startRelativeAltitudeRecording()
//        }
//        print("STARTED NAVBIGATION")
//    }
//    
//    
//    
//    func stopNavigation() async {
//        do {
//            self.mapState = MapStateOld.postFlight
//            guard let flightUnwrapped = self.flight else { return }
//            try await self.flightStore.flightSave(flight: flightUnwrapped)
//        } catch {
//            print("ERRORED OUT")
//        }
//    }
//}
