import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var boards: [TodoBoard]
    @State private var showingAddBoard = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(boards) { board in
                    NavigationLink(destination: BoardView(board: board)) {
                        Text(board.title)
                    }
                }
                .onDelete(perform: deleteBoards)
            }
            .navigationTitle("Boards")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showingAddBoard = true }) {
                        Label("Add Board", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddBoard) {
                AddBoardView()
            }
        }
    }
    
    private func deleteBoards(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(boards[index])
            }
        }
    }
}

struct AddBoardView: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Board Title", text: $title)
                Button("Add Board") {
                    addBoard()
                }
            }
            .navigationTitle("New Board")
            .navigationBarItems(trailing: Button("Cancel") { dismiss() })
        }
    }
    
    private func addBoard() {
        let newBoard = TodoBoard(title: title)
        modelContext.insert(newBoard)
        dismiss()
    }
}