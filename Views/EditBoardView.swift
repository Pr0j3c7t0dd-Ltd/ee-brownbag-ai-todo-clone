import SwiftUI
import SwiftData

struct EditBoardView: View {
    @ObservedObject var board: TodoBoard
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String
    
    init(board: TodoBoard) {
        self.board = board
        _title = State(initialValue: board.title)
    }
    
    var body: some View {
        Form {
            TextField("Board Title", text: $title)
            
            Button("Save") {
                board.title = title
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Edit Board")
    }
}