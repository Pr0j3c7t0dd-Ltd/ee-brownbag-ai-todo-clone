# Technical Specifications for a Simple SwiftUI App Using SwiftData

## Overview
Develop a modern, simple SwiftUI application that utilizes SwiftData for data persistence. The app will manage a list of items using custom models. All models will adhere to best practices, avoid conflicts with reserved names, and conform to the necessary protocols for seamless integration with SwiftUI and SwiftData.

## 1. Import Necessary Libraries
Ensure all necessary libraries are imported in your Swift files:

```swift
import SwiftUI
import SwiftData
import Foundation
```

## 2. Data Models

### 2.1. Model Requirements
* **Naming Conventions**: Prepend `Todo` to all model names to avoid conflicts with Apple's built-in models and SwiftUI structures.
* **Protocols**: Conform to `ObservableObject` AND  `Identifiable` protocols.
* **ID Property**: Include an `id` property of type `UUID` with a default value of `UUID()`.
* **Attributes**: Do not use reserved names like `description` or `name` for attributes.
* **Relationships**: DO NOT include any `@Relationship` to other models.
* **Simplicity**: Keep models as simple as possible.

### 2.2. Example Model

```swift
@Model
final class TodoItem: ObservableObject, Identifiable {
    var id: UUID = UUID()
    var title: String
    var details: String?

    init(title: String, details: String? = nil) {
        self.title = title
        self.details = details
    }
}
```

## 3. SwiftData ModelContainer Setup
Ensure there is an active and valid `ModelContainer` for the models in the app.

### 3.1. Configuration
In your main app file or a dedicated configuration file, set up the `ModelContainer`:

```swift
let container = ModelContainer(for: [TodoItem.self])
```

## 4. Main App File
Update the main App file to display the initial view and conform to the persistence model in SwiftData.

### 4.1. Example `App` Struct

```swift
@main
struct TodoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [TodoItem.self])
        }
    }
}
```

## 5. Views
Create SwiftUI views that interact with your models.

### 5.1. ContentView

```swift
struct ContentView: View {
    @Query private var items: [TodoItem]

    var body: some View {
        List(items) { item in
            Text(item.title)
        }
    }
}
```

## 6. Additional Guidelines
* **No CoreData**: DO NOT use CoreData; use SwiftData exclusively.
* **No Predicate Macros**: Avoid using the Predicate macro in models.
* **ObservedObject Usage**: If using `@ObservedObject`, ensure the models conform to `ObservableObject`.
* **No Circular References**: Ensure there are no circular references in model relationships (though models should not have relationships).
* **Delete Rules**: Since there are no relationships, delete rules like `.cascade` are not applicable.
* **Reserved Names**: Avoid using reserved attribute names such as `description` or `name`.

## 7. Summary
By following these specifications, you'll create a simple SwiftUI app that efficiently uses SwiftData for data management. The models are straightforward, avoiding complexity and potential conflicts with SwiftUI and Apple's reserved names. The app is set up to display data persistently, with a valid `ModelContainer` and an updated main App file that launches the initial view.