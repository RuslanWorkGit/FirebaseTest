//
//  SignInGoogleHelper.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 07.04.2025.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInResultModel {
    let idToken: String
    let accessToken: String  
}

final class SignInGoogleHelper {
    
    @MainActor
    func signIn() async throws -> GoogleSignInResultModel {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResults = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResults.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken = gidSignInResults.user.accessToken.tokenString
        
        let token = GoogleSignInResultModel(idToken: idToken, accessToken: accessToken)
        return token
    }
}
