//
//  GlidingMapViewContrller.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/15/24.
//

import Foundation
import UIKit
import MapKit
import SwiftUI

class GlidingMapViewController: UIViewController {
    let imageryMapConfig = MKImageryMapConfiguration()
    var mapView = MKMapView()
    
    var mapState: MapState = .preFlight {
        didSet {
            switch mapState {
            case .preFlight:
                setPreFlight()
            case .inFlight:
                setInFlight()
            case .postFlight:
                setPostFlight()
            }
        }
    }
    
    var thermals: [Thermal] = []
    
    var navigationModel: NavigationModel
    
    init(navigationModel: NavigationModel) {
        self.navigationModel = navigationModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = mapView
        self.mapView.delegate = self
        self.mapView.showsUserLocation = true
        mapView.preferredConfiguration = imageryMapConfig
        setLocation()
    }
    
    func setLocation() {
        addThermalAnnotations(thermals: [Self.thermal, Self.thermalOne])
        
        guard let location = navigationModel.locationModel.currentLocation else { return }
        mapView.setCenter(location.coordinate, animated: true)
        
        // FOR DEBUGGING
    }
    
    func setPreFlight() {
        
    }
    
    func setInFlight() {
        
    }
    
    func setPostFlight() {
        
    }
}



// Annotation Adding/Removing
extension GlidingMapViewController {
    func addThermalAnnotations(thermals: [Thermal]) {
        self.thermals.append(contentsOf: thermals)
        self.mapView.addAnnotations(thermals.map({ ThermalAnnotation(thermal: $0) }))
    }
    
    func removeThermalAnnotations(thermals: [Thermal]) {
        self.thermals = self.thermals.filter { element in thermals.contains  { thermal in
            if thermal.id == element.id {
                return true
            } else {
                return false
            }
        }}
        
        let ids = thermals.map({ $0.id })
        var annotationsToRemove: [ThermalAnnotation] = []
        for annotation in self.mapView.annotations {
            let thermalAnnotation = annotation as? ThermalAnnotation
            if thermalAnnotation != nil {
                if ids.contains(thermalAnnotation!.id) {
                    annotationsToRemove.append(thermalAnnotation!)
                }
            }
        }
        self.mapView.removeAnnotations(annotationsToRemove)
    }
}

// FOR DEBUGGING
extension GlidingMapViewController {
    static let thermal = Thermal(
        id: "JKL",
        location: Location(date: "JKL", latitude: 37.1, longitude: -122.600, altitude: 37.0),
        glider: Glider(id: "jKL", name: "lll"),
        detectedOn: "JKL"
    )
    static let thermalOne = Thermal(
        id: "ONE",
        location: Location(date: "ONE", latitude: 30.1, longitude: -102.600, altitude: 36.0),
        glider: Glider(id: "BBB", name: "BBB"),
        detectedOn: "JKL"
    )
}
