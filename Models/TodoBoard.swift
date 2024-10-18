import Foundation
import SwiftData

@Model
final class TodoBoard: Identifiable {
    var id: UUID
    var boardTitle: String
    @Relationship(deleteRule: .cascade) var lists: [TodoList] = []
    
    init(boardTitle: String) {
        self.id = UUID()
        self.boardTitle = boardTitle
    }
}
