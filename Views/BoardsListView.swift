import SwiftUI
import SwiftData

struct BoardsListView: View {
    @Query private var boards: [TodoBoard]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationView {
            List(boards) { board in
                NavigationLink(destination: BoardView(board: board)) {
                    Text(board.boardTitle)
                }
            }
            .navigationTitle("Boards")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addBoard) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
    
    private func addBoard() {
        let newBoard = TodoBoard(boardTitle: "New Board")
        modelContext.insert(newBoard)
    }
}
