import SwiftUI
import SwiftData

struct AddListView: View {
    @ObservedObject var board: TodoBoard
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var title = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("List Title", text: $title)
                Button("Add List") {
                    addList()
                }
            }
            .navigationTitle("New List")
            .navigationBarItems(trailing: Button("Cancel") { dismiss() })
        }
    }
    
    private func addList() {
        let newList = TodoList(title: title)
        board.lists.append(newList)
        newList.board = board
        modelContext.insert(newList)
        dismiss()
    }
}