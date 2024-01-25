//
//  GetLocation.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/24/24.
//

import SwiftUI

//func sendTrackingInfo() {
//    struct Message: Encodable {
//        let name: String
//        let age: Int
//    }
//    
//    
//    let url: URL = URL(string: "http://192.168.200.119:3000/datasend/gps")!
//    var request = URLRequest(url: url)
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.setValue("application/json", forHTTPHeaderField: "Accept")
//    request.httpMethod = "POST"
//    let data = Message(name: "Andrew", age: 26)
//    request.httpBody = try! JSONEncoder().encode(data)
//    print(request.httpBody)
//    
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            print("Sent")
//    }
//    task.resume()
//}

struct StartTracking: View {
    @Binding var gps: GPSModel
    
    func locationUpdate() {
        gps.locationManager.requestLocation()
    }
    
    var body: some View {
        Button(action: locationUpdate) {
            Text("Start Tracking")
                .padding()
        }
        .background(Color(red: 0, green:0, blue: 0.2))
        .foregroundStyle(.white)
        .clipShape(Capsule())
    }
}

//#Preview {
//    StartTracking(gps: nil)
//}
