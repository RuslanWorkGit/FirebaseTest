//
//  SettingViewModel.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 06.04.2025.
//

import SwiftUI

@MainActor
final class SettingViewModel: ObservableObject {
    
    @Published var authProviders: [AuthProviderOption] = []
    @Published var authUser: AuthDataResultModel? = nil
    
    func loadAuthProviders() {
        if let provider = try? AunthetificationManager.shared.getProvider() {
            authProviders = provider
        }
    }
    
    func loadAuthUser() {
        self.authUser = try? AunthetificationManager.shared.getAuthenticatedUser()
    }
    
    
    
    func signOut() throws {
        try AunthetificationManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AunthetificationManager.shared.getAuthenticatedUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
            return
        }
        
        try await AunthetificationManager.shared.resetPassword(email: email)
    }
    
    
    func updateEmail() async throws {
        let email = "test123@gmail.com"
        try await AunthetificationManager.shared.updateEmail(email: email)
    }

    
    func updatePassword() async throws {
        
        let password = "hello123!"
        try await AunthetificationManager.shared.updatePassword(password: password)
        
    }
}
