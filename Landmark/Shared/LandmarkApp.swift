//
//  LandmarkApp.swift
//  Shared
//
//  Created by Toni Kari on 11/01/2021.
//

import SwiftUI



@main
struct LandmarkApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                        }
        }
    }
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchWithOptions launchOptions:
                        [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Deleted")
        return true
    }
}

