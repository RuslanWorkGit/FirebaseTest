//
//  AuthenticationViewModel.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 07.04.2025.
//

import Foundation
import GoogleSignIn
import FirebaseAuth


@MainActor
final class AuthenticationViewModel: ObservableObject {
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let token = try await helper.signIn()
        try await AunthetificationManager.shared.signInWithGoogle(tokens: token)
    }
}
