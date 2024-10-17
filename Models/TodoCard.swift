import Foundation
import SwiftData

@Model class TodoCard: Identifiable {
    var id: UUID = UUID()
    var cardTitle: String
    var cardDescription: String?
    @Relationship(inverse: \TodoList.cards) var list: TodoList?
    
    init(cardTitle: String, cardDescription: String? = nil) {
        self.cardTitle = cardTitle
        self.cardDescription = cardDescription
    }
}
