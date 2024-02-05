//
//  GlidingMapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI
import MapKit

struct GlidingMapKit: UIViewRepresentable {
    
    @EnvironmentObject var navigationModel: NavigationModel
    let mapView: MKMapView
    
    init() {
        self.mapView = MKMapView()
        self.mapView.preferredConfiguration = MKImageryMapConfiguration()
    }
    
    func makeUIView(context: Context) -> MKMapView {
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
