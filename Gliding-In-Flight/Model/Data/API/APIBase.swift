//
//  Out.swift
//  Gliding-In-Flight
//
//  Created by Andrew on 1/24/24.
//

import Foundation
import CoreLocation

struct APIBase {
    enum RequestType: String {
        case GET = "GET"
        case POST = "POST"
        case PUT = "PUT"
        case DELETE = "DELETE"
    }

    static func getRequest<T: Decodable>(path: String, responseType: T.Type) {
        let url: URL = URL(string: "\(Config.url):\(Config.port)\(path)")!
        var request: URLRequest = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = RequestType.GET.rawValue
        
        // Get request does not have a body
        request.httpBody = nil
        
        let task = URLSession.shared.dataTask(with: request) {(dataOpt, response, error) -> Void in
            guard let data = dataOpt else { return }
            guard let decodedData = try? JSONDecoder().decode(responseType, from: data) else { return }
            print(decodedData)
        }
        task.resume()
    }
    
    static func postRequest<T: Decodable>(path: String, responseType: T.Type, requestData: Encodable) {
        let url: URL = URL(string: "\(Config.url):\(Config.port)\(path)")!
        var request: URLRequest = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = RequestType.POST.rawValue
        
        guard let bodyData = try? JSONEncoder().encode(requestData) else { return }
        request.httpBody = bodyData
        
        let task = URLSession.shared.dataTask(with: request) {(dataOpt, respone, error) -> Void in
            guard let data = dataOpt else { return }
            guard let decodedData = try? JSONDecoder().decode(responseType, from: data) else { return }
            print(decodedData)
        }
        task.resume()
    }
    
    static func putRequest(path: String, data: Encodable) {
        let url: URL = URL(string: "\(Config.url):\(Config.port)\(path)")!
        var request: URLRequest = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = RequestType.PUT.rawValue
        
        let bodyDataOpt: Data? = try? JSONEncoder().encode(data)
        guard let bodyData = bodyDataOpt else { return }
        request.httpBody = bodyData
        
        let task = URLSession.shared.dataTask(with: request) {(dataOpt, response, error) -> Void in
            guard let data = dataOpt else { return }
            print(data)
            return
        }
        task.resume()
    }
    
    static func deleteRequest(path: String, data: Encodable? = nil) {
        let url: URL = URL(string: "\(Config.url):\(Config.port)\(path)")!
        var request: URLRequest = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = RequestType.DELETE.rawValue
        
        // Delete request does not have a body
        request.httpBody = nil
        
        let task = URLSession.shared.dataTask(with: request) {(dataOpt, response, error) -> Void in
            guard let data = dataOpt else { return }
            print(data)
            return
        }
        task.resume()
    }
    
}


//func sendTrackingInfo(_ locations: [CLLocation]) {
//    struct Message: Encodable {
//        let dateTime: String
//        let latitude: Double
//        let longitude: Double
//        let altitude: Double
//        let speed: Double
//    }
//    
//    // Date and Time Processing
//    let date = Date()
//    let components = Calendar.current.dateComponents([.month,.day,.year,.hour,.minute,.second], from: date)
////    let month = components.month
////    let day = components.day
////    let year = components.year
////    let hour = components.hour
////    let minute = components.minute
////    let second = components.second
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "MM/dd/yyyy - hh:mm:ss"
//    let dateStringRep = dateFormatter.string(from: date)
//    
//    
//    
//    let url: URL = URL(string: "http://192.168.200.119:3000/glider-tracking/gps")!
//    var request = URLRequest(url: url)
//    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//    request.setValue("application/json", forHTTPHeaderField: "Accept")
//    request.httpMethod = "POST"
//    
//    let data = Message(
//        dateTime: dateStringRep,
//        latitude: Double(locations[0].coordinate.latitude),
//        longitude: Double(locations[0].coordinate.latitude),
//        altitude: Double(locations[0].altitude),
//        speed: Double(locations[0].speed)
//    )
//    request.httpBody = try! JSONEncoder().encode(data)
//    
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//            print("Sent")
//    }
//    task.resume()
//}
