//
//  GlidingMapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI
import MapKit

struct GlidingMapView: View {
    
    let glidingMapKit = GlidingMapKit()
    
    var body: some View {
        ZStack {
            O
            glidingMapKit
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            RouteStartStop()
        }
    }
}

#Preview {
    GlidingMapView()
}
