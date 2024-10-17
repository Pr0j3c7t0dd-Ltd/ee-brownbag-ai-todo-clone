import SwiftUI
import SwiftData

struct BoardView: View {
    @Bindable var board: TodoBoard
    
    var body: some View {
        VStack {
            HStack {
                Button(action: { /* Close board */ }) {
                    Image(systemName: "xmark")
                }
                Spacer()
                Text(board.boardTitle)
                Spacer()
                Button(action: { /* Open settings */ }) {
                    Image(systemName: "gearshape")
                }
                Button(action: { /* Open notifications */ }) {
                    Image(systemName: "bell")
                }
            }
            .padding()
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(board.lists) { list in
                        ListView(list: list)
                    }
                    AddListView(board: board)
                }
            }
        }
        .background(Color.blue)
    }
}
