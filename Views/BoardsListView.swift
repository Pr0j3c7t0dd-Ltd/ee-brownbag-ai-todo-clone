import SwiftUI
import SwiftData

struct BoardsListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \TodoBoard.boardTitle) private var boards: [TodoBoard]
    @State private var isAddingBoard = false
    @State private var editingBoard: TodoBoard?
    @State private var debugMessage = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(boards) { board in
                        NavigationLink(destination: BoardView(board: board)) {
                            Text(board.boardTitle)
                        }
                        .contextMenu {
                            Button("Edit") {
                                editingBoard = board
                            }
                            Button("Delete", role: .destructive) {
                                deleteBoard(board)
                            }
                        }
                    }
                }
                .overlay(Group {
                    if boards.isEmpty {
                        Text("No boards yet. Tap + to add one.")
                    }
                })
                Text("Debug: \(debugMessage)")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .navigationTitle("Boards")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { isAddingBoard = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingBoard) {
                AddEditBoardView(isPresented: $isAddingBoard, modelContext: modelContext, onSave: { newBoard in
                    debugMessage = "Added board: \(newBoard.boardTitle)"
                })
            }
            .sheet(item: $editingBoard) { board in
                AddEditBoardView(isPresented: .constant(true), modelContext: modelContext, board: board, onSave: { updatedBoard in
                    debugMessage = "Updated board: \(updatedBoard.boardTitle)"
                })
            }
            .onAppear {
                debugMessage = "Boards count: \(boards.count)"
                print("Debug: Boards count: \(boards.count)")
                for board in boards {
                    print("Debug: Board title: \(board.boardTitle)")
                }
            }
        }
    }
    
    private func deleteBoard(_ board: TodoBoard) {
        modelContext.delete(board)
        do {
            try modelContext.save()
            debugMessage = "Deleted board: \(board.boardTitle)"
        } catch {
            debugMessage = "Error deleting board: \(error.localizedDescription)"
        }
    }
}

struct AddEditBoardView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isPresented: Bool
    let modelContext: ModelContext
    let board: TodoBoard?
    let onSave: (TodoBoard) -> Void
    
    @State private var boardTitle: String
    
    init(isPresented: Binding<Bool>, modelContext: ModelContext, board: TodoBoard? = nil, onSave: @escaping (TodoBoard) -> Void) {
        self._isPresented = isPresented
        self.modelContext = modelContext
        self.board = board
        self.onSave = onSave
        self._boardTitle = State(initialValue: board?.boardTitle ?? "")
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Board Title", text: $boardTitle)
            }
            .navigationTitle(board == nil ? "Add Board" : "Edit Board")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveBoard()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveBoard() {
        let savedBoard: TodoBoard
        if let existingBoard = board {
            existingBoard.boardTitle = boardTitle
            savedBoard = existingBoard
        } else {
            let newBoard = TodoBoard(boardTitle: boardTitle)
            modelContext.insert(newBoard)
            savedBoard = newBoard
        }
        do {
            try modelContext.save()
            onSave(savedBoard)
        } catch {
            print("Error saving board: \(error.localizedDescription)")
        }
    }
}
