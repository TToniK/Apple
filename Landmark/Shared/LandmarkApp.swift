//
//  LandmarkApp.swift
//  Shared
//
//  Created by Toni Kari on 11/01/2021.
//

import SwiftUI

@main
struct LandmarkApp: App {
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
                        }
        }
    }

