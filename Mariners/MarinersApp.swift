//
//  MarinersApp.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/14/22.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAppCheck
//import FirebaseAuth



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

      FirebaseApp.configure()

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
