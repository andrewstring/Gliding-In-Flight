//
//  Model.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/21/24.
//

import SwiftUI
import CoreLocation


class GPSModel: ObservableObject {
    
    typealias CLLocationAccuracy = Double
    let locationManager: CLLocationManager
    let locationDelegate: LocationDelegate

    
    init(activityType: CLActivityType) {
        self.locationDelegate = LocationDelegate()
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self.locationDelegate
        self.locationManager.activityType = activityType
    }
}

class LocationDelegate: NSObject, CLLocationManagerDelegate, ObservableObject {
    
    func sendTrackingInfo(_ locations: [CLLocation]) {
        struct Message: Encodable {
            let latitude: Double
            let longitude: Double
        }
        
        
        let url: URL = URL(string: "http://192.168.200.119:3000/datasend/gps")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "POST"
        let data = Message(latitude: Double(locations[0].coordinate.latitude), longitude: Double(locations[0].coordinate.latitude))
        request.httpBody = try! JSONEncoder().encode(data)
        print(request.httpBody)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
                print("Sent")
        }
        task.resume()
    }
    
    func locationManagerDidChangeAuthorization(_ locationManager: CLLocationManager) {
        switch locationManager.authorizationStatus {
            case .authorizedAlways:
                print("good")
            default:
                locationManager.requestAlwaysAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        sendTrackingInfo(locations)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR")
    }
}
