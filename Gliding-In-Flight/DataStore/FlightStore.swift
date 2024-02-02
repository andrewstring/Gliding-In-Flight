//
//  FlightStore.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/1/24.
//

import Foundation

// Handles the persistent storage of the flight
class FlightStore: ObservableObject {
    @Published var flight: Flight?
        
    private static func flightURL() throws -> URL? {
        do {
            let flightURL = try FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: false
            )
            .appendingPathComponent("flight.data")
            print(flightURL)
            return flightURL
        } catch {
            print("Error in FlightStore.flightURL")
            return nil
        }
    }
    
    func flightLoad() async throws {
        guard let flightURL = try Self.flightURL() else { return }
        guard let flightData = try? Data(contentsOf: flightURL) else { return }
        self.flight = try? JSONDecoder().decode(Flight.self, from: flightData)
    }
}
