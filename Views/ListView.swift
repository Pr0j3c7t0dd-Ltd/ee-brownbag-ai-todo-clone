import SwiftUI
import SwiftData
import UniformTypeIdentifiers

struct ListView: View {
    @Bindable var list: TodoList
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(list.listTitle)
                Spacer()
                Button(action: { /* Open list settings */ }) {
                    Image(systemName: "ellipsis")
                }
            }
            .padding()
            .background(Color.white.opacity(0.5))
            .cornerRadius(10)
            
            ForEach(list.cards) { card in
                CardView(card: card)
                    .onDrag {
                        NSItemProvider(object: card.id.uuidString as NSString)
                    }
                    .onDrop(of: [UTType.text], delegate: CardDropDelegate(list: list, card: card))
            }
            
            Button(action: addCard) {
                Text("+ Add Card")
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
    
    private func addCard() {
        let newCard = TodoCard(cardTitle: "New Card")
        list.cards.append(newCard)
    }
}
