//
//  Model.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/5/24.
//

import Foundation

class Model: ObservableObject {
    
    
    // Navigation && GPS Models
    @Published var locationModel: LocationModel
    @Published var navigationModel: NavigationModel
    @Published var barometricModel: BarometricModel
    
    // DataStore Models
    @Published var gliderStore: GliderStore
    
    init() {
        self.locationModel = LocationModel(activityType: Config.Model.activityType)
        self.navigationModel = NavigationModel()
        self.barometricModel = BarometricModel()
        
        self.gliderStore = GliderStore()
        print("GLIDER")
        print(self.gliderStore.glider)
    }
}
