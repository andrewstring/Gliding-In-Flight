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
    @EnvironmentObject var locationModel: LocationModel
    let mapView: MKMapView
    let currentLocationAnnotation: MKAnnotation?
    
    init() {
        self.mapView = MKMapView()
        self.mapView.preferredConfiguration = MKImageryMapConfiguration()
        self.currentLocationAnnotation = nil
    }
    
    func makeUIView(context: Context) -> MKMapView {
        if let centerCoordinate = locationModel.newLocation?.coordinate {
            self.mapView.centerCoordinate = centerCoordinate
            self.mapView.showsUserLocation = true
            self.mapView.addAnnotation(MKPointAnnotation(__coordinate: centerCoordinate, title: "jkl", subtitle: "jkl"))
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
