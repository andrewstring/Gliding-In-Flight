//
//  GlidingMapViewControllerRepresentable.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/5/24.
//

import Foundation
import SwiftUI

struct GlidingMapViewControllerRepresentable: UIViewControllerRepresentable {
    
    @EnvironmentObject var navigationModel: NavigationModel
    
    typealias UIViewControllerType = GlidingMapViewController
    
    func makeUIViewController(context: Context) -> GlidingMapViewController {
        return GlidingMapViewController(navigationModel: navigationModel)
    }
    
    func updateUIViewController(_ uiViewController: GlidingMapViewController, context: Context) {
        return
    }
    
}
