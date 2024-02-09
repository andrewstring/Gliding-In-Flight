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
    
    init() {
        self.flight = nil
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
    
    @MainActor
    func flightsLoad() async throws {
        let task = Task<Flight?, Error> {
            guard let flightURL = try? Self.flightURL() else { print("1"); return nil }
            guard let flightData = try? Data(contentsOf: flightURL) else { print("2"); return nil }
            print("FLIGHT DATA")
            print(flightData)
            guard let decodedFlightData = try? JSONDecoder().decode(Flight.self, from: flightData) else { print("3"); return nil }
            return decodedFlightData
        }
        self.flight = try await task.value
    }
    
    @MainActor
    func flightSave(flight: Flight) async throws -> Flight? {
        let task = Task<Flight?, Error> {
            guard let flightURL = try? Self.flightURL() else { return nil }
            guard let encodedFlight = try? JSONEncoder().encode(flight) else { return nil }
            try encodedFlight.write(to: flightURL)
            return flight
        }
        return try await task.value
    }
    
    @MainActor
    func flightRemove() async throws -> Void {
        let task = Task<Void, Error> {
            guard let flightURL = try? Self.flightURL() else { return }
            let emptyFlight = Data()
            try emptyFlight.write(to: flightURL)
            return
        }
        return try await task.value
    }
    
}
