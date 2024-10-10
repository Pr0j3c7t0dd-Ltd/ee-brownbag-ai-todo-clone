import SwiftUI
import SwiftData

struct EditCardView: View {
    @ObservedObject var card: TodoCard
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String
    @State private var description: String
    
    init(card: TodoCard) {
        self.card = card
        _title = State(initialValue: card.title)
        _description = State(initialValue: card.cardDescription)
    }
    
    var body: some View {
        Form {
            TextField("Card Title", text: $title)
            TextEditor(text: $description)
                .frame(height: 200)
            
            Button("Save") {
                card.title = title
                card.cardDescription = description
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Edit Card")
    }
}