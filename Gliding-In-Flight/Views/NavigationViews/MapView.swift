//
//  MapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/22/24.
//

import SwiftUI
import MapKit


struct MapView: View {
    
    @EnvironmentObject private var locationSetup: LocationSetup
    
    
    let nycCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.7128, longitude: 74.0060)
    
    var body: some View {
        if #available(iOS 17.0, *) {
            Map {
//                Marker("JKL", coordinate: nycCoordinates)
                UserAnnotation()
            }.onAppear()
        } else {
            OutdatedIOS()
        }
    }
//
//    var body: some View {
//        Map {
//            Marker
//        }
//        Map(coordinateRegion: MapView.coordinateRegion) {
//            MapMarker(coordinate: MapView.nycCoordinates)
//        }
//    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
