import SwiftUI
import SwiftData

struct ListView: View {
    @Bindable var list: TodoList
    @State private var isAddingCard = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(list.listTitle)
                    .font(.headline)
                Spacer()
                Button(action: { /* Open list settings */ }) {
                    Image(systemName: "ellipsis")
                }
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView {
                LazyVStack(spacing: 8) {
                    ForEach(list.cards) { card in
                        CardView(card: card)
                    }
                }
                .padding(.horizontal)
            }
            
            Button(action: { isAddingCard = true }) {
                HStack {
                    Image(systemName: "plus")
                    Text("Add Card")
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.1))
                .cornerRadius(8)
            }
            .padding(.horizontal)
            .padding(.bottom)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 5)
        .sheet(isPresented: $isAddingCard) {
            AddEditCardView(isPresented: $isAddingCard, list: list)
        }
    }
}

struct AddEditCardView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isPresented: Bool
    @Bindable var list: TodoList
    
    @State private var cardTitle = ""
    @State private var cardDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Card Title", text: $cardTitle)
                TextField("Description", text: $cardDescription)
            }
            .navigationTitle("Add Card")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveCard()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveCard() {
        let newCard = TodoCard(cardTitle: cardTitle, cardDescription: cardDescription)
        list.cards.append(newCard)
    }
}
