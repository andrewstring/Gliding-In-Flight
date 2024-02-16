//
//  GlidingMapViewController+Delegate.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/15/24.
//

import Foundation
import MapKit



extension GlidingMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didSelect annotation: MKAnnotation) {
        guard let thermal = fetchThermalFromAnnotation(annotation: annotation) else { return }
        self.present(ThermalModalController(parentView: self.view, thermal: thermal), animated: true)
        self.mapView.deselectAnnotation(annotation, animated: false)
    }
    
    
    func fetchThermalFromAnnotation(annotation: MKAnnotation) -> Thermal? {
        guard let thermalAnnotation = annotation as? ThermalAnnotation else { return nil }
        let thermalFilter = self.thermals.filter({ $0.id == thermalAnnotation.id })
        if thermalFilter.count > 0 {
            return thermalFilter[0]
        }
        return nil
    }
}
