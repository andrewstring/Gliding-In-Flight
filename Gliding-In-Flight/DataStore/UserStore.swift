//
//  UserStore.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 1/31/24.
//

import Foundation

// Handles the persistent storage of the primary user
class UserStore: ObservableObject {
    @Published var user: Glider?
    
    private static func userURL() throws -> URL? {
        do {
            let userURL = try FileManager.default.url(for: .documentDirectory,
                                        in: .userDomainMask,
                                        appropriateFor: nil,
                                        create: true
            )
            .appendingPathComponent("user.data")
            print(userURL)
            return userURL
        } catch {
            print("Error in UserStore.userURL")
            return nil
        }
    }
    
    func userLoad() async throws {
        let task = Task<Glider?, Error> {
            guard let userURL = try? Self.userURL() else { return nil }
            guard let userData = try? Data(contentsOf: userURL) else { return nil }
            let decodedUserData = try? JSONDecoder().decode(Glider.self, from: userData)
            return decodedUserData
        }
        self.user = try? await task.value
    }
    
    func userSave(user: Glider) async throws -> Glider? {
        let task = Task<Glider?, Error> {
            guard let userURL = try? Self.userURL() else { return nil }
            guard let encodedUser = try? JSONEncoder().encode(user) else { return nil }
            try encodedUser.write(to: userURL)
            return user
        }
        return try await task.value
    }
}
