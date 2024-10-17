import Foundation
import SwiftData

@Model class TodoList: Identifiable {
    var id: UUID = UUID()
    var listTitle: String
    @Relationship(deleteRule: .cascade) var cards: [TodoCard] = []
    @Relationship(inverse: \TodoBoard.lists) var board: TodoBoard?
    
    init(listTitle: String) {
        self.listTitle = listTitle
    }
}
