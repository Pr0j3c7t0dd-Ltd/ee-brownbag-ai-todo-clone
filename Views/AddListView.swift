import SwiftUI
import SwiftData

struct AddListView: View {
    @Bindable var board: TodoBoard
    
    var body: some View {
        Button(action: addList) {
            Text("+ Add List")
                .padding()
                .background(Color.white.opacity(0.5))
                .cornerRadius(10)
        }
    }
    
    private func addList() {
        let newList = TodoList(listTitle: "New List")
        board.lists.append(newList)
    }
}
