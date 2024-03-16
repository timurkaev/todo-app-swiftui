//
//  ContentView.swift
//  ios-proj
//
//  Created by Ismail Timurkaev on 16.03.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Home()
                .navigationTitle("Todo List")
        }
    }
}

#Preview {
    ContentView()
}
