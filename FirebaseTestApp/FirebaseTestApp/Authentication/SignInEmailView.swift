//
//  SignInEmailView.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 05.04.2025.
//

import SwiftUI

@MainActor
final class SignInEmailViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or password found")
            return
        }
        
        Task {
            do {
                let returnedDataUser = try await AunthetificationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedDataUser)
            } catch {
                print("Error: \(error)")
            }
        }
        
        
        
    }
}


struct SignInEmailView: View {
    
    @StateObject private var viewModel = SignInEmailViewModel()
    var body: some View {
        VStack {
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            Button {
                viewModel.signIn()
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .padding()
                    .frame(height: 55)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }

            Spacer()
        
        }
        .padding()
        .navigationTitle("Sign in with Email")
        
    }
}

#Preview {
    NavigationStack {
        SignInEmailView()
    }
}
