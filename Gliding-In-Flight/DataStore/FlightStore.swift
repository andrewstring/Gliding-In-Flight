//
//  FlightStore.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/1/24.
//

import Foundation

// Handles the persistent storage of the flight
class FlightStore: ObservableObject {
    @Published var flights: [Flight]
    
    init() {
        self.flights = []
    }
        
    private static func flightURL() throws -> URL? {
        do {
            let flightURL = try FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: true
            )
            .appendingPathComponent("flight.data")
            print(flightURL)
            return flightURL
        } catch {
            print("Error in FlightStore.flightURL")
            return nil
        }
    }
    
    func flightsLoad() async throws {
        let task = Task<[Flight], Error> {
            guard let flightURL = try? Self.flightURL() else { return [] }
            guard let flightData = try? Data(contentsOf: flightURL) else { return [] }
            guard let decodedFlightData = try? JSONDecoder().decode([Flight].self, from: flightData) else { return [] }
            return decodedFlightData
        }
        self.flights = try await task.value
    }
    
    func flightSave(flight: Flight) async throws -> Flight? {
        let task = Task<Flight?, Error> {
            guard let flightURL = try? Self.flightURL() else { return nil }
            guard let encodedFlight = try? JSONEncoder().encode(flight) else { return nil }
            try encodedFlight.write(to: flightURL)
            return flight
        }
        return try await task.value
    }
}
