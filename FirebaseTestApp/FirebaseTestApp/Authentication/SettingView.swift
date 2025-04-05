//
//  SettingView.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 05.04.2025.
//

import SwiftUI

@MainActor
final class SettingViewModel: ObservableObject {
    
    func signOut() throws {
        try AunthetificationManager.shared.signOut()
    }
}


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
        }
        .navigationTitle("Setting")
    }
}

#Preview {
    NavigationStack {
        SettingView(showSignInView: .constant(false))
    }
}
