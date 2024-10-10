import SwiftUI
import SwiftData

struct BoardView: View {
    @ObservedObject var board: TodoBoard
    @Environment(\.modelContext) private var modelContext
    @State private var draggedCard: TodoCard?
    @State private var showingEditBoard = false
    @State private var showingAddList = false
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(alignment: .top, spacing: 16) {
                ForEach(board.lists) { list in
                    ListView(list: list, draggedCard: $draggedCard)
                }
                Button(action: { showingAddList = true }) {
                    VStack {
                        Image(systemName: "plus")
                        Text("Add List")
                    }
                    .frame(width: 300, height: 100)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                }
            }
            .padding()
        }
        .navigationTitle(board.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showingEditBoard = true }) {
                    Label("Edit Board", systemImage: "pencil")
                }
            }
        }
        .sheet(isPresented: $showingEditBoard) {
            EditBoardView(board: board)
        }
        .sheet(isPresented: $showingAddList) {
            AddListView(board: board)
        }
    }
}