//
//  GlidingMapView.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/4/24.
//

import SwiftUI
import MapKit

struct GlidingMapView: View {
    @EnvironmentObject var navigationModel: NavigationModel
    
    var content: String?
    
//    let glidingMapViewRepresentable: GlidingMapViewRepresentable = GlidingMapViewRepresentable()
    
    var body: some View {
        if navigationModel.gliderStore.glider != nil {
            GeometryReader { geometry in
                VStack {
                    RouteNavbarView()
//                    ScrollView {
//                        if let nav = navigationModel.flight {
//                            Text(String(describing: nav.representation))
//                                .lineLimit(nil)
//                                .frame(width: geometry.size.width)
//                        } else {
//                            Text("Navigation Data will populate")
//                        }
//                    }
//                    glidingMapViewRepresentable
//                        .fixedSize(horizontal: false, vertical: false)
                    GlidingMapViewControllerRepresentable()
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
