# Technical Specification

## Overview
Develop a SwiftUI app using SwiftData for data persistence. The app manages lists of tasks (boards, lists, and cards), with each model mapped to a SwiftUI view that reflects its data. Models must adhere to SwiftUI and SwiftData conventions to ensure seamless data binding and UI updates.

## 1. Libraries
```swift
import SwiftUI
import SwiftData
import Foundation
```

## 2. Data Models

### 2.1. Model Requirements
* **Naming Conventions**: Prefix model names with `Todo` to avoid conflicts with reserved Swift names.
* **Protocols**: Models should conform to `Identifiable` for use in SwiftUI lists and collections.
* **Attributes**: Avoid reserved names like `description` or `name`. Use distinct, descriptive property names (e.g., `cardTitle`, `listTitle`).
* **UUID IDs**: All models must include an `id` property of type `UUID` initialized with a default value (`UUID()`).
* **Relationships**: Models should maintain one-to-many relationships where appropriate, avoiding circular references.

### 2.2. Model Definitions

```swift
@Model class TodoBoard: Identifiable {
    var id: UUID = UUID()
    var boardTitle: String
    var lists: [TodoList] = []
}

@Model class TodoList: Identifiable {
    var id: UUID = UUID()
    var listTitle: String
    var cards: [TodoCard] = []
}

@Model class TodoCard: Identifiable {
    var id: UUID = UUID()
    var cardTitle: String
    var cardDescription: String?
}
```

**Key Points:**

- **Removed `ObservableObject` Conformance**: The `@Model` macro automatically provides observability through the `Observable` protocol, making manual conformance to `ObservableObject` unnecessary.
- **Adjusted Property Names**: Ensured that property names are descriptive and do not conflict with reserved Swift keywords.
- **Simplified Relationships**: Maintained one-to-many relationships without introducing potential circular references.

## 3. Persistence
All models must utilize SwiftData for persistence. SwiftData handles data storage and retrieval for `@Model` objects automatically, eliminating the need for manual persistence management. Avoid using CoreData or Predicate macros.

## 4. UI-to-Model Binding

### 4.1. Binding Models in Views
Use the `@Bindable` property wrapper in views to observe and mutate model data. This ensures that any changes to the model are automatically reflected in the UI.

```swift
import Foundation
import SwiftData

@Model class TodoBoard: Identifiable {
    var id: UUID = UUID()
    var boardTitle: String
    @Relationship(deleteRule: .cascade) var lists: [TodoList] = []
    
    init(boardTitle: String) {
        self.boardTitle = boardTitle
    }
}

@Model class TodoList: Identifiable {
    var id: UUID = UUID()
    var listTitle: String
    @Relationship(deleteRule: .cascade) var cards: [TodoCard] = []
    @Relationship(inverse: \TodoBoard.lists) var board: TodoBoard?
    
    init(listTitle: String) {
        self.listTitle = listTitle
    }
}

@Model class TodoCard: Identifiable {
    var id: UUID = UUID()
    var cardTitle: String
    var cardDescription: String?
    @Relationship(inverse: \TodoList.cards) var list: TodoList?
    
    init(cardTitle: String, cardDescription: String? = nil) {
        self.cardTitle = cardTitle
        self.cardDescription = cardDescription
    }
}

```

**Explanation:**

- **Using `@Bindable`**: This property wrapper works with models conforming to the `Observable` protocol (provided by `@Model`), allowing the view to observe changes and mutate the model directly.
- **State Persistence**: Since SwiftData manages persistence for `@Model` objects, additional property wrappers like `@StateObject` or `@ObservedObject` are unnecessary for persistence purposes.

### 4.2. Data Fetching with `@Query`
When fetching data from the SwiftData context, use the `@Query` property wrapper for seamless integration with SwiftUI.

```swift
struct BoardsListView: View {
    @Query var boards: [TodoBoard]

    var body: some View {
        List(boards) { board in
            NavigationLink(destination: BoardView(board: board)) {
                Text(board.boardTitle)
            }
        }
    }
}
```

**Note:** The `@Query` property wrapper automatically fetches and observes changes to the data collection.

## 5. Drag-and-Drop

### 5.1. Implementing Drag-and-Drop Interactions
Use SwiftUI's `onDrag` and `onDrop` modifiers to implement drag-and-drop functionality. Ensure that model updates are performed within the SwiftData context to maintain data integrity and persistence.

```swift
struct ListView: View {
    @Bindable var list: TodoList

    var body: some View {
        VStack {
            ForEach(list.cards) { card in
                CardView(card: card)
                    .onDrag {
                        // Provide drag data
                        NSItemProvider(object: card.cardTitle as NSString)
                    }
                    .onDrop(of: [UTType.text], delegate: CardDropDelegate(droppedCard: card, list: list))
            }
        }
    }
}
```

### 5.2. Drop Delegate Implementation
Create a custom `DropDelegate` to handle the drop logic and update the model accordingly.

```swift
struct CardDropDelegate: DropDelegate {
    let droppedCard: TodoCard
    @Bindable var list: TodoList

    func performDrop(info: DropInfo) -> Bool {
        // Extract the dragged card's data
        // Update the `cards` array in `list`
        // SwiftData handles persistence and UI updates
        return true
    }
}
```

**Key Considerations:**

- **Model Updates**: Any changes to the `cards` array in `TodoList` will automatically persist and reflect in the UI due to SwiftData's integration.
- **Data Consistency**: Ensure that the drag-and-drop operations maintain data consistency within the models.

## 6. Additional Notes

### 6.1. Avoiding Circular References
Ensure that relationships between models do not create strong reference cycles. Keep relationships unidirectional unless there's a specific need for bidirectional references.

### 6.2. SwiftUI Best Practices
- **Data Flow**: Follow SwiftUI's data flow principles by using appropriate property wrappers (`@Bindable`, `@Query`) to manage state and data flow.
- **State Management**: Rely on SwiftData's automatic state management for `@Model` objects, reducing the need for manual state handling.

### 6.3. Error Handling
Implement proper error handling when performing data operations, especially during drag-and-drop interactions, to ensure a robust user experience.

## Misc notes

- Use the '@Query' format and not the '@ObservedObject' format per the models
- import UniformTypeIdentifiers statement to import the UTType enum.
- Make sure models have an init method
- Make sure to import SwiftData

## Summary

- **Models**: Utilize the `@Model` macro without manual `ObservableObject` conformance. Models should conform to `Identifiable` and use descriptive property names.
- **Views**: Use `@Bindable` to interact with models, allowing for observation and mutation within the UI.
- **Persistence**: Leverage SwiftData for automatic persistence of `@Model` objects, simplifying data storage management.
- **Drag-and-Drop**: Implement drag-and-drop using `onDrag` and `onDrop`, updating models directly to reflect changes in the UI.
- **Data Integrity**: Ensure all model updates maintain data integrity and are performed within the SwiftData context.

By adhering to these guidelines, the app will align with SwiftUI and SwiftData best practices, ensuring efficient data management, seamless UI updates, and an overall responsive user experience.