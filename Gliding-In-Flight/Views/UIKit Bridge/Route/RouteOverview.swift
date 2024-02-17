//
//  RouteOverview.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/17/24.
//

import Foundation
import MapKit
import CoreLocation

struct RouteOverview {
    static func generateRouteOverview(locations: [Location]) -> MKPolyline {
        let route = MKPolyline(
            coordinates: locations.map{ CLLocationCoordinate2D(
                latitude: $0.latitude,
                longitude: $0.longitude
            )},
            count: locations.count
        )
        return route
    }
    
    static func renderRouteOverview(overview: MKPolyline) -> MKPolylineRenderer {
        let overviewRenderer = MKPolylineRenderer(polyline: overview)
        overviewRenderer.strokeColor = .blue
        overviewRenderer.lineWidth = 2.0
        return overviewRenderer
    }
}
