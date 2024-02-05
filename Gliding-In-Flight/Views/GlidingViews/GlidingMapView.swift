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
        GeometryReader { geometry in
            VStack {
                RouteNavbarView()
                glidingMapKit
                    .fixedSize(horizontal: false, vertical: false)
                RouteStartStopView()
            }
        }
        .frame(maxHeight: .infinity)
        .background(Color(.lightGray))
    }
}

#Preview {
    GlidingMapView()
}
