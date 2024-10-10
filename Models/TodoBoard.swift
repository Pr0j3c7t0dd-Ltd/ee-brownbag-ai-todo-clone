import Foundation
import SwiftUI
import SwiftData

@Model
final class TodoBoard: Identifiable, ObservableObject {
    var id: UUID
    var title: String
    @Relationship(deleteRule: .cascade) var lists: [TodoList]
    
    init(id: UUID = UUID(), title: String, lists: [TodoList] = []) {
        self.id = id
        self.title = title
        self.lists = lists
    }
}