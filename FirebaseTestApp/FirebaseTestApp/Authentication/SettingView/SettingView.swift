//
//  SettingView.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 05.04.2025.
//

import SwiftUI

struct SettingView: View {
    @StateObject private var viewModel = SettingViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List {
            Button("Log out") {
                Task {
                    do {
                        try viewModel.signOut()
                        showSignInView = true
                    } catch {
                        print("error: \(error)")
                    }
                }
            }
            if viewModel.authProviders.contains(.email) {
                emailSection
            }
            
            if viewModel.authUser?.isAnonymus == true {
                anonymusSection
            }
            
             
        }
        .onAppear {
            viewModel.loadAuthProviders()
            viewModel.loadAuthUser()
        }
        .navigationTitle("Setting")
    }
}

#Preview {
    NavigationStack {
        SettingView(showSignInView: .constant(false))
    }
}

extension SettingView {
    private var emailSection: some View {
        Section {
            Button("Reset password") {
                Task {
                    do {
                        try await viewModel.resetPassword()
                        print("Passsowrd  reset")
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Update password") {
                Task {
                    do {
                        try await viewModel.updatePassword()
                        print("Password update")
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Update email") {
                Task {
                    do {
                        try await viewModel.updateEmail()
                        print("Email update")
                    } catch {
                        print(error)
                    }
                }
            }

        } header: {
            Text("Email functions")
        }
    }
    
    private var anonymusSection: some View {
        Section {
            Button("Link Google Account") {
                Task {
                    do {
                        try await viewModel.loadAuthUser()
                    } catch {
                        print(error)
                    }
                }
            }
            
            Button("Link email Account") {
                Task {
                    do {
                        try await viewModel.loadAuthUser()
                    } catch {
                        print(error)
                    }
                }
            }
        } header: {
            Text("Create Account")
        }
    }
}
