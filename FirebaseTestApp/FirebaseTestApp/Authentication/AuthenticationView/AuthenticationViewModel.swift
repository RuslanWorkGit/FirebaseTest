//
//  AuthenticationViewModel.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 07.04.2025.
//

import Foundation
import GoogleSignIn
import FirebaseAuth

struct GoogleSignInResultmodel {
    let idToken: String
    let accessToken: String
    
    
}

@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResults = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResults.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSignInResults.user.accessToken.tokenString
        
        let token = GoogleSignInResultmodel(idToken: idToken, accessToken: accessToken)
                
        try await AunthetificationManager.shared.signInWithGoogle(tokens: token)
    }
}
