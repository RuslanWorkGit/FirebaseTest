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
            
            emailSection
             
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
}
