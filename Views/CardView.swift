import SwiftUI
import SwiftData

struct CardView: View {
    @Bindable var card: TodoCard
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(card.cardTitle)
            if let description = card.cardDescription {
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
