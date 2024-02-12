//
//  GetLocation.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/24/24.
//

import SwiftUI

struct TESTER: View {
//    @Binding var gps: GPSModel
    
    func locationUpdate() {
//        gps.locationManager.requestLocation()
    }
    
    var body: some View {
        Button(action: { print("test") }) {
            Text("Start Tracking")
                .padding()
        }
        .background(Color(red: 0, green:0, blue: 0.2))
        .foregroundStyle(.white)
        .clipShape(Capsule())
        .padding()
        Button(action: {APIGlider.getGlider(gliderId: "testMMM")} ) {
            Text("Get Glider")
                .padding()
        }
        .background(Color(red: 0, green:0, blue: 0.2))
        .foregroundStyle(.white)
        .clipShape(Capsule())
        .padding()
        Button(action: {APIGlider.addGlider(num: "1234")} ) {
            Text("Add Glider")
                .padding()
        }
        .background(Color(red: 0, green:0, blue: 0.2))
        .foregroundStyle(.white)
        .clipShape(Capsule())
        .padding()
    }
}

//#Preview {
//    StartTracking(gps: nil)
//}
