//
//  ProfileViewModel.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 14.05.2025.
//

import SwiftUI

@MainActor
class ProfileViewModel: ObservableObject {
    
    @Published private(set) var user: AuthDataResultModel? = nil
    
    func loadCurrentUser() throws {
        
        self.user = try AunthetificationManager.shared.getAuthenticatedUser()
    }
}
