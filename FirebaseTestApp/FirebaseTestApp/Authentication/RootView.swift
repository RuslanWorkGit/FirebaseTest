//
//  RootView.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 05.04.2025.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSignInView: Bool = false
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                SettingView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AunthetificationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil /*? true : false*/
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                AuntheticationView()
            }
        }
    }
}

#Preview {
    RootView()
}
