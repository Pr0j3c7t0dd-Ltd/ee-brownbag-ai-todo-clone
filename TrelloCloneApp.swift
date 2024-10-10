import SwiftUI
import SwiftData

@main
struct TrelloCloneApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [TodoBoard.self, TodoList.self, TodoCard.self])
    }
}