import SwiftUI
import SwiftData

@main
struct AITodoCloneApp: App {
    let container: ModelContainer
    
    init() {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: false)
            container = try ModelContainer(for: TodoBoard.self, configurations: config)
        } catch {
            fatalError("Failed to create ModelContainer for TodoBoard: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            BoardsListView()
                .modelContainer(container)
        }
    }
}
