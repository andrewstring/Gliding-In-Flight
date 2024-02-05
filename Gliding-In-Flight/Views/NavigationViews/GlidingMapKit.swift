//
//  GlidingMapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI
import MapKit

struct GlidingMapKit: UIViewRepresentable {
    
    enum MapState {
        case preFlight
        case inFlight
        case postFlight
    }
    
    
    let mapView: MKMapView
    let mapState: MapState
    
    init() {
        self.mapView = MKMapView()
        self.mapView.preferredConfiguration = MKImageryMapConfiguration()
        self.mapState = .preFlight
    }
    
    func makeUIView(context: Context) -> MKMapView {
        switch self.mapState {
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
        switch self.mapState {
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
