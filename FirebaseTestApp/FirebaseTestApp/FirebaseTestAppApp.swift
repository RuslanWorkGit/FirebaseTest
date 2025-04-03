//
//  FirebaseTestAppApp.swift
//  FirebaseTestApp
//
//  Created by Ruslan Liulka on 03.04.2025.
//

import SwiftUI
import Firebase

@main
struct FirebaseTestAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("Configure firebase!")
        return true
    }
}
