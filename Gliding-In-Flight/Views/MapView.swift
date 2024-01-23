//
//  MapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/22/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    static let nycCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.7128, longitude: 74.0060)
    static let coordinateRegion = MKCoordinateRegion(nycCoordinates, 1, 1)
    
    var body: some View {
        Map {
            Marker
        }
        Map(coordinateRegion: MapView.coordinateRegion) {
            MapMarker(coordinate: MapView.nycCoordinates)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
