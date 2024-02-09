//
//  GliderStore.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/31/24.
//

import Foundation

// Handles the persistent storage of the primary glider
class GliderStore: ObservableObject {
    @Published var glider: Glider?
    
    init() {
        Task {
            try await self.gliderLoad()
        }
    }
    
    private static func gliderURL() throws -> URL? {
        do {
            let gliderURL = try FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: true
            )
            .appendingPathComponent("glider.data")
            print(gliderURL)
            return gliderURL
        } catch {
            print("Error in GliderStore.gliderURL")
            return nil
        }
    }
    
    @MainActor
    func gliderLoad() async throws {
        let task = Task<Glider?, Error> {
            guard let gliderURL = try? Self.gliderURL() else { return nil }
            guard let gliderData = try? Data(contentsOf: gliderURL) else { return nil }
            let decodedGliderData = try? JSONDecoder().decode(Glider.self, from: gliderData)
            return decodedGliderData
        }
        self.glider = try? await task.value
    }
    
    @MainActor
    func gliderSave(glider: Glider) async throws -> Glider? {
        let task = Task<Glider?, Error> {
            guard let gliderURL = try? Self.gliderURL() else { return nil }
            guard let encodedGlider = try? JSONEncoder().encode(glider) else { return nil }
            try encodedGlider.write(to: gliderURL)
            try await self.gliderLoad()
            return glider
        }
        return try await task.value
    }
    
    @MainActor
    func gliderRemove() async throws -> Void {
        let task = Task<Void, Error> {
            guard let gliderURL = try? Self.gliderURL() else { return }
            let emptyGlider = Data()
            try emptyGlider.write(to: gliderURL)
            return
        }
        return try await task.value
    }
}
