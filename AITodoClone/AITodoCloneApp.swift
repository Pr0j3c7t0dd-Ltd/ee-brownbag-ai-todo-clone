//
//  AITodoCloneApp.swift
//  AITodoClone
//
//  Created by Todd Anderson on 10/10/2024.
//

import SwiftUI
import SwiftData

@main
struct AITodoCloneApp: App {
    var body: some Scene {
         WindowGroup {
             ContentView()
         }
         .modelContainer(for: [TodoBoard.self, TodoList.self, TodoCard.self])
     }
}
