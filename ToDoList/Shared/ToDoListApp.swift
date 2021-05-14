//
//  ToDoListApp.swift
//  Shared
//
//  Created by Toni Kari on 14.5.2021.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var order = Order()

    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
