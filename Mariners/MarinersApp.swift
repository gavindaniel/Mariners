//
//  MarinersApp.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/14/22.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAppCheck
//import FirebaseAuth


class MyAppCheckProviderFactory: NSObject, AppCheckProviderFactory {
  func createProvider(with app: FirebaseApp) -> AppCheckProvider? {
    #if targetEnvironment(simulator)
      // App Attest is not available on simulators.
      // Use a debug provider.
      return AppCheckDebugProvider(app: app)
    #else
      // Use App Attest provider on real devices.
      return AppAttestProvider(app: app)
    #endif
  }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Set an instance of MyAppCheckProviderFactory as an App Check
        // provider factory before configuring Firebase.
        AppCheck.setAppCheckProviderFactory(MyAppCheckProviderFactory())


        // [START default_firestore]
        FirebaseApp.configure()

        let db = Firestore.firestore()
        // [END default_firestore]
        
        print(db) // silence warning
        
        return true
    }
}


@main
struct MarinersApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
