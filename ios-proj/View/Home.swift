//
//  Home.swift
//  ios-proj
//
//  Created by Ismail Timurkaev on 16.03.2024.
//

import SwiftUI
import SwiftData

struct Home: View {
    @Query(filter: #Predicate<Todo> {!$0.isCompleted}, sort: [SortDescriptor(\Todo.lastUpdate, order: .reverse)], animation: .snappy)
    private var activeList: [Todo]
    // Model Context
    @Environment(\.modelContext) private var context
    @State private var showAll: Bool = false
    var body: some View {
        List {
            Section(activeSectionTitle) {
                ForEach(activeList) {
                    TodoRowView(todo: $0)
                }
            }
            
            // Completed List
            CompletedTodoList(showAll: $showAll)
        }
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    // Creating an Empty Todo Task
                    let todo = Todo(task: "", priority: .normal)
                    // Saving item into context
                    context.insert(todo)
                }, label: {
                    Image(systemName: "plus.circle.fill")
                        .fontWeight(.light)
                        .font(.system(size: 42))
                })
            }
        }
    }
    var activeSectionTitle: String {
        let count = activeList.count
        return count == 0 ? "Active" : "Active (\(count)"
    }
}

#Preview {
    ContentView()
}
