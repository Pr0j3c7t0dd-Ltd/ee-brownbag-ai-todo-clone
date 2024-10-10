import SwiftUI
import SwiftData

struct ListView: View {
    @ObservedObject var list: TodoList
    @Environment(\.modelContext) private var modelContext
    @Binding var draggedCard: TodoCard?
    @State private var showingEditList = false
    @State private var showingAddCard = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(list.title)
                    .font(.headline)
                Spacer()
                Button(action: { showingEditList = true }) {
                    Image(systemName: "pencil")
                }
            }
            
            ForEach(list.cards) { card in
                CardView(card: card)
                    .onDrag {
                        self.draggedCard = card
                        return NSItemProvider(object: card.id.uuidString as NSString)
                    }
            }
            
            Button(action: { showingAddCard = true }) {
                Label("Add Card", systemImage: "plus")
            }
        }
        .frame(width: 300)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .onDrop(of: [.text], delegate: CardDropDelegate(list: list, draggedCard: $draggedCard, modelContext: modelContext))
        .sheet(isPresented: $showingEditList) {
            EditListView(list: list)
        }
        .sheet(isPresented: $showingAddCard) {
            AddCardView(list: list)
        }
    }
}

struct CardDropDelegate: DropDelegate {
    let list: TodoList
    @Binding var draggedCard: TodoCard?
    let modelContext: ModelContext
    
    func performDrop(info: DropInfo) -> Bool {
        guard let draggedCard = draggedCard else { return false }
        
        if let sourceList = draggedCard.list {
            sourceList.cards.removeAll { $0.id == draggedCard.id }
        }
        
        draggedCard.list = list
        list.cards.append(draggedCard)
        
        modelContext.insert(draggedCard)
        
        return true
    }
}