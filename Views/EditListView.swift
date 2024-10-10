import SwiftUI
import SwiftData

struct EditListView: View {
    @ObservedObject var list: TodoList
    @Environment(\.presentationMode) var presentationMode
    @State private var title: String
    
    init(list: TodoList) {
        self.list = list
        _title = State(initialValue: list.title)
    }
    
    var body: some View {
        Form {
            TextField("List Title", text: $title)
            
            Button("Save") {
                list.title = title
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Edit List")
    }
}