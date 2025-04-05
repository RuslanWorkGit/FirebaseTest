//
//  AuntheticationView.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 05.04.2025.
//

import SwiftUI

struct AuntheticationView: View {
    var body: some View {
        VStack {
            NavigationLink {
                SignInEmailView()
            } label: {
                Text("Sign in with Email")
                    .font(.headline)
                    .padding()
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                

                 
            }
            
            Spacer()

        }
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack {
        AuntheticationView()
    }
}
