//
//  UserStore.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/31/24.
//

import Foundation

// Handles the persistent storage of the primary user
class UserStore: ObservableObject {
    @Published var user: Glider
    
    private static func userURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false
        )
        .appendingPathComponent("user.data")
    }
    
    func userLoad() async throws {
        let task = Task<Glider, Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return nil
            }
            let loadedUser = try JSONDecoder().decode(Glider.self, from: data)
            return loadedUser
        }
    }
}
