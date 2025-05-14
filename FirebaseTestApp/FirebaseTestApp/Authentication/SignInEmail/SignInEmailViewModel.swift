//
//  SignInEmailViewModel.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 06.04.2025.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signUp() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("Not found Email or passwod")
            return
        }
        
        let returedDataUser = try await AunthetificationManager.shared.createUser(email: email, password: password)
    }
    
    func signIn() async throws {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        let returnedDataUser = try await AunthetificationManager.shared.signInUser(email: email, password: password)
        print("Success")
        print(returnedDataUser) 
    }
}
