import SwiftUI
import SwiftData

struct BoardView: View {
    @Bindable var board: TodoBoard
    @State private var isAddingList = false
    
    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Button(action: { /* Close board */ }) {
                    Image(systemName: "xmark")
                }
                Spacer()
                Text(board.boardTitle)
                    .font(.headline)
                Spacer()
                Button(action: { /* Open settings */ }) {
                    Image(systemName: "gearshape")
                }
                Button(action: { /* Open notifications */ }) {
                    Image(systemName: "bell")
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            
            // Lists
            ScrollView(.horizontal) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(board.lists) { list in
                        ListView(list: list)
                    }
                    
                    Button(action: { isAddingList = true }) {
                        VStack {
                            Image(systemName: "plus")
                            Text("Add List")
                        }
                        .frame(width: 200, height: 50)
                        .background(Color.white.opacity(0.2))
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.blue.opacity(0.1))
        .edgesIgnoringSafeArea(.bottom)
        .sheet(isPresented: $isAddingList) {
            AddEditListView(isPresented: $isAddingList, board: board)
        }
    }
}

struct AddEditListView: View {
    @Environment(\.dismiss) private var dismiss
    @Binding var isPresented: Bool
    @Bindable var board: TodoBoard
    
    @State private var listTitle = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("List Title", text: $listTitle)
            }
            .navigationTitle("Add List")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        saveList()
                        dismiss()
                    }
                }
            }
        }
    }
    
    private func saveList() {
        let newList = TodoList(listTitle: listTitle)
        board.lists.append(newList)
    }
}
