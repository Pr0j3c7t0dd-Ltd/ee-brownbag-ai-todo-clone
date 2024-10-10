import SwiftUI
import SwiftData

struct AddCardView: View {
    @ObservedObject var list: TodoList
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Card Title", text: $title)
                TextEditor(text: $description)
                    .frame(height: 100)
                Button("Add Card") {
                    addCard()
                }
            }
            .navigationTitle("New Card")
            .navigationBarItems(trailing: Button("Cancel") { dismiss() })
        }
    }
    
    private func addCard() {
        let newCard = TodoCard(title: title, cardDescription: description)
        list.cards.append(newCard)
        newCard.list = list
        modelContext.insert(newCard)
        dismiss()
    }
}