//
//  ios_projApp.swift
//  ios-proj
//
//  Created by Ismail Timurkaev on 16.03.2024.
//

import SwiftUI

@main
struct ios_projApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Todo.self)
    }
}
