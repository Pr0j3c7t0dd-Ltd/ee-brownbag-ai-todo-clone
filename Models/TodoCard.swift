import Foundation
import SwiftUI
import SwiftData

@Model
final class TodoCard: Identifiable, ObservableObject {
    var id: UUID
    var title: String
    var cardDescription: String
    var list: TodoList?
    
    init(id: UUID = UUID(), title: String, cardDescription: String = "", list: TodoList? = nil) {
        self.id = id
        self.title = title
        self.cardDescription = cardDescription
        self.list = list
    }
}