//
//  GlidingMapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI
import MapKit

struct GlidingMapView: View {
    @EnvironmentObject var gliderStore: GliderStore
    var content: String?
    
    let glidingMapViewRepresentable: GlidingMapViewRepresentable = GlidingMapViewRepresentable()
    
    var body: some View {
        if gliderStore.glider != nil {
            GeometryReader { geometry in
                VStack {
                    RouteNavbarView()
//                    glidingMapViewRepresentable
                    ScrollView {
                        Text(content)
                            .lineLimit(nil)
                            .frame(width: geometry.size.width)
                    }
//                        .fixedSize(horizontal: false, vertical: false)
                    RouteStartStopView()
                }
            }
            .frame(maxHeight: .infinity)
            .background(Color(.lightGray))
        } else {
            IssueWithDataView()
        }
    }
}

#Preview {
    GlidingMapView()
}
