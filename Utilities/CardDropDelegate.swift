import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct CardDropDelegate: DropDelegate {
    @Bindable var list: TodoList
    let card: TodoCard
    @Environment(\.modelContext) private var modelContext
    
    func performDrop(info: DropInfo) -> Bool {
        guard let itemProvider = info.itemProviders(for: [UTType.text]).first else {
            return false
        }
        
        itemProvider.loadObject(ofClass: String.self) { (draggedCardId, error) in
            guard let draggedCardId = draggedCardId as? String,
                  let draggedCardUUID = UUID(uuidString: draggedCardId) else {
                return
            }
            
            DispatchQueue.main.async {
                if let draggedCard = list.cards.first(where: { $0.id == draggedCardUUID }) {
                    let fromIndex = list.cards.firstIndex(of: draggedCard)!
                    let toIndex = list.cards.firstIndex(of: card)!
                    
                    if fromIndex != toIndex {
                        list.cards.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
                    }
                } else {
                    let fetchDescriptor = FetchDescriptor<TodoCard>(predicate: #Predicate { $0.id == draggedCardUUID })
                    if let draggedCard = try? modelContext.fetch(fetchDescriptor).first {
                        if let oldList = draggedCard.list {
                            oldList.cards.removeAll { $0.id == draggedCard.id }
                        }
                        list.cards.insert(draggedCard, at: list.cards.firstIndex(of: card)!)
                        draggedCard.list = list
                    }
                }
            }
        }
        
        return true
    }
}
