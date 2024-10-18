import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct CardDropDelegate: DropDelegate {
    let droppedCard: TodoCard
    @Bindable var list: TodoList
    
    func performDrop(info: DropInfo) -> Bool {
        guard let draggedCardTitle = info.itemProviders(for: [UTType.text]).first?.loadObject(ofClass: String.self, completionHandler: { result, error in
            if let error = error {
                print("Error loading object: \(error.localizedDescription)")
            }
        }) else {
            return false
        }
        
        if let draggedCard = list.cards.first(where: { $0.cardTitle == draggedCardTitle as? String }) {
            let draggedIndex = list.cards.firstIndex(of: draggedCard)!
            let droppedIndex = list.cards.firstIndex(of: droppedCard)!
            
            if draggedIndex < droppedIndex {
                list.cards.insert(draggedCard, at: droppedIndex + 1)
                list.cards.remove(at: draggedIndex)
            } else {
                list.cards.remove(at: draggedIndex)
                list.cards.insert(draggedCard, at: droppedIndex)
            }
        }
        
        return true
    }
}
