import Foundation
import SwiftData

@Model class TodoBoard: Identifiable {
    var id: UUID = UUID()
    var boardTitle: String
    @Relationship(deleteRule: .cascade) var lists: [TodoList] = []
    
    init(boardTitle: String) {
        self.boardTitle = boardTitle
    }
}
