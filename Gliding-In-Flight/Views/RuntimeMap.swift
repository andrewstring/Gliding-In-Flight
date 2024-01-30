//
//  RuntimeMpa.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/28/24.
//

import SwiftUI
import MapKit

struct RuntimeMap: View {
    
    @Binding var gps: GPSModel
    
    var body: some View {
        if #available(iOS 17.0, *) {
            Map {
                Marker("JKL", coordinate: gps.locationManager.location!.coordinate)
            }
            .mapControls {
                MapCompass()
                MapUserLocationButton()
            }
        } else {
            OutdatedIOS()
        }
    }
}

//#Preview {
//    RuntimeMap()
//}
