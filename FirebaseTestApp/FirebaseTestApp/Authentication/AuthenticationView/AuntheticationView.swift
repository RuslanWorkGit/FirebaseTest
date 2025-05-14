//
//  AuntheticationView.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 05.04.2025.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

struct AuntheticationView: View {
    
    @StateObject private var viewModel = AuthenticationViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack {
            
            Button {
                Task {
                    do {
                        try await viewModel.signInAnonymus()
                        showSignInView = false
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Anonymus")
                    .font(.headline)
                    .padding()
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity)
                    .background(Color.orange)
                    .cornerRadius(10)
            }

            
            NavigationLink {
                SignInEmailView(showSingInView: $showSignInView)
            } label: {
                Text("Sign in with Email")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
         
            }
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
                
                Task {
                    do {
                        try await viewModel.signInGoogle()
                        showSignInView = false
                    } catch {
                        print(error)
                    }
                }
            }
            
            
            Spacer()

        }
        .padding()
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuntheticationView(showSignInView: .constant(false))
    }
}
