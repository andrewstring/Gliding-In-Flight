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
                                        create: false
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
        guard let userURL = try Self.userURL() else { return }
        guard let userData = try? Data(contentsOf: userURL) else { return }
        self.user = try? JSONDecoder().decode(Glider.self, from: userData)
    }
    
    
}
