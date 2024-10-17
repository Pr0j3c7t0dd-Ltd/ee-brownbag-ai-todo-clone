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
* **Protocols**: Conform to `ObservableObject`protocols.
* **ID Property**: Include an `id` property of type `UUID` with a default value of `UUID()`.
* **Attributes**: Do not use reserved names like `description` or `name` for attributes.
* **Relationships**: DO NOT include any `@Relationship` to other models.
* **Simplicity**: Keep models as simple as possible.


## 6. Additional Guidelines
* **No CoreData**: DO NOT use CoreData; use SwiftData exclusively.
* **No Predicate Macros**: Avoid using the Predicate macro in models.
* **ObservedObject Usage**: If using `@ObservedObject`, ensure the models conform to `ObservableObject`.
* **No Circular References**: Ensure there are no circular references in model relationships (though models should not have relationships).
* **Delete Rules**: Since there are no relationships, delete rules like `.cascade` are not applicable.
* **Reserved Names**: Avoid using reserved attribute names such as `description` or `name`.

Reference the product-requirements.md document for details on the app's functionality and design.
