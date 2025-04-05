//
//  AunthetificatioManager.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 05.04.2025.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AunthetificationManager {
    
    static let shared = AunthetificationManager()
    
    private init () {}
    
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return AuthDataResultModel(user: user)
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResults = try await Auth.auth().createUser(withEmail: email, password: password)
        let results = AuthDataResultModel(user: authDataResults.user)
        return results
        
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
