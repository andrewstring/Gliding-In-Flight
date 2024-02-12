//
//  GlidingMapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI
import MapKit

struct GlidingMapView: View {
    @EnvironmentObject var model: Model
    
    var content: String?
    
    let glidingMapViewRepresentable: GlidingMapViewRepresentable = GlidingMapViewRepresentable()
    
    var body: some View {
        if model.gliderStore.glider != nil {
            GeometryReader { geometry in
                VStack {
                    RouteNavbarView()
                    ScrollView {
                        Text(String(describing: model.navigationModel.flight ?? nil))
                            .lineLimit(nil)
                            .frame(width: geometry.size.width)
                    }
//                    glidingMapViewRepresentable
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
