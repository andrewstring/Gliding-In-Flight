//
//  GlidingMapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI
import MapKit

struct GlidingMapViewRepresentable: UIViewRepresentable {
    
    @EnvironmentObject var navigationModel: NavigationModel
    let mapView: MKMapView
    let currentLocationAnnotation: MKAnnotation?
    
    init() {
        self.mapView = MKMapView()
        self.mapView.preferredConfiguration = MKImageryMapConfiguration()
        self.currentLocationAnnotation = nil
        setMapView()
    }
    
    func setMapView() {
        switch self.navigationModel.mapState {
        case .preFlight:
            self.mapView.showsCompass = false
        case .inFlight:
            self.mapView.showsCompass = true
        case .postFlight:
            self.mapView.showsCompass = true
        }
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let compass = MKCompassButton()
        compass.compassVisibility = .visible
        self.mapView.addSubview(compass)
        if let centerCoordinate = navigationModel.locationModel.newLocation?.coordinate {
            self.mapView.centerCoordinate = centerCoordinate
            self.mapView.showsUserLocation = true
        }
        switch navigationModel.mapState {
            case .preFlight:
                print("PRE FLIGHT")
                return self.mapView
            case .inFlight:
                print("IN FLIGHT")
                return self.mapView
            case .postFlight:
                print("POST FLIGHT")
                return self.mapView
        }
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        switch navigationModel.mapState {
            case .preFlight:
                print("PRE FLIGHT")
            case .inFlight:
                print("IN FLIGHT")
            case .postFlight:
                print("POST FLIGHT")
        }
    }
    
    func test() {
        print("TEST SUCCESSFUL")
    }
}
