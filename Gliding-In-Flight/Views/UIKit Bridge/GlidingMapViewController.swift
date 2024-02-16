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
        guard let location = navigationModel.locationModel.newLocation else { return }
        mapView.setCenter(location.coordinate, animated: true)
        
        // FOR DEBUGGING
        addThermalAnnotations(thermals: [Self.thermal])
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
        location: Location(date: "JKL", latitude: 37.1, longitude: -122.600),
        glider: Glider(id: "jKL", name: "lll"),
        detectedOn: "JKL"
    )
}
