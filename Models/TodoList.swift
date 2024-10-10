import Foundation
import SwiftUI
import SwiftData

@Model
final class TodoList: Identifiable, ObservableObject {
    var id: UUID
    var title: String
    @Relationship(deleteRule: .cascade) var cards: [TodoCard]
    var board: TodoBoard?
    
    init(id: UUID = UUID(), title: String, cards: [TodoCard] = [], board: TodoBoard? = nil) {
        self.id = id
        self.title = title
        self.cards = cards
        self.board = board
    }
}