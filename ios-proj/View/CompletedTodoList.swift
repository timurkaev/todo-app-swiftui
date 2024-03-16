//
//  CompletedTodoList.swift
//  ios-proj
//
//  Created by Ismail Timurkaev on 16.03.2024.
//

import SwiftUI
import SwiftData

struct CompletedTodoList: View {
    @Binding var showAll: Bool
    @Query private var completedList: [Todo]
    init(showAll: Binding<Bool>) {
        let predicate = #Predicate<Todo> { $0.isCompleted }
        let sort = [SortDescriptor(\Todo.lastUpdate, order: .reverse)]
        
        var descriptor = FetchDescriptor(predicate: predicate, sortBy: sort)
        if !showAll.wrappedValue {
            descriptor.fetchLimit = 2
        }
        
        _completedList = Query(descriptor, animation: .snappy)
        _showAll = showAll
    }
    
    // View Properties
    var body: some View {
        Section {
            ForEach(completedList) {
                TodoRowView(todo: $0)
            }
        } header: {
            HStack {
                Text("Completed")
                
                Spacer(minLength: 0)
                
                if showAll && !completedList.isEmpty {
                    Button("Show Recents") {
                        showAll = false
                    }
                }
            }
            .font(.caption)
        } footer: {
            if completedList.count == 2 && !showAll && !completedList.isEmpty {
                HStack {
                    Text("Showing Recent 15 Tasks")
                        .foregroundStyle(.gray)
                    
                    Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                    
                    Button("Show all") {
                        showAll = true
                    }
                }
                .font(.caption)
            }
        }
    }
}

#Preview {
    ContentView()
}
