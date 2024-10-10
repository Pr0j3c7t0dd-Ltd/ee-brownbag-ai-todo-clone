import SwiftUI

struct CardView: View {
    @ObservedObject var card: TodoCard
    @State private var showingEditCard = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(card.title)
                .font(.headline)
            Text(card.cardDescription)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
        .onTapGesture {
            showingEditCard = true
        }
        .sheet(isPresented: $showingEditCard) {
            EditCardView(card: card)
        }
    }
}