//
//  Todo.swift
//  ios-proj
//
//  Created by Ismail Timurkaev on 16.03.2024.
//

import SwiftUI
import SwiftData

@Model
class Todo {
    private(set) var taskID: String = UUID().uuidString
    var task: String
    var isCompleted: Bool = false
    var priority: Priority = Priority.normal
    var lastUpdate: Date = Date.now
    
    init(task: String, priority: Priority) {
        self.task = task
        self.priority = priority
    }
}

// Priority status
enum Priority: String, Codable, CaseIterable {
    case normal = "Normal"
    case medium = "Medium"
    case high = "High"
    
    // Priority Color
    var color: Color {
        switch self {
        case .normal:
            return .green
        case .medium:
            return .yellow
        case .high:
            return .red
        }
    }
}
