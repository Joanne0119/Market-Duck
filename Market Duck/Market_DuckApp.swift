//
//  Market_DuckApp.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/19.
//

import SwiftUI
import GoogleMaps

@main
struct Market_DuckApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
       
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let googleApi = "AIzaSyD1pAJyfwG2fzZhArG4OyI5CK-HkXhWCys"
        GMSServices.provideAPIKey(googleApi)
        return true
    }
}
