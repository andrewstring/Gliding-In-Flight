//
//  MapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/22/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    let nycCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.7128, longitude: 74.0060)
    
    var body: some View {
        Map {
            MapCircle("JKL", coordinate: .nycCoordinates)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
