# Design Specification

## Layout

### Header Section
- The top header bar displays a title, such as "Test Board." On the left side, there is an "X" icon, which functions as a back or close button. On the right side, there are icons for settings and notifications, providing quick access to secondary functions.

### Column (List of Cards)
- Each column represents a "List" of task cards. The list header contains a title like "To Do," centered within a rounded rectangular container.
- The ellipsis icon on the right of the list header indicates additional settings (e.g., renaming or deleting the list).

### Cards
- Each task is represented by a card, which is displayed in a white, rectangular container with subtle shadowing to stand out from the background.
- Cards should be simple, with only a title and an optional description, as specified by the `@Model` for `Card`. Cards are ordered by their position within a list and are draggable within or between lists.

### Add Card Button
- The "+ Add Card" button is positioned below the existing cards. Clicking this button triggers a SwiftUI view that allows the user to input a new card's details.

## Colors

### Background
- The background is a solid medium blue (#007AFF or similar). Cards have a white background with light gray text, ensuring a clean, minimalist interface.

### Icons and Text
- All icons (e.g., "X," ellipsis, settings, and notifications) are white or light gray, and text on headers and cards follows a similar color scheme for easy readability against the blue background.

## Interaction Points
- The UI is touch-friendly, designed for comfortable interaction on mobile devices. Drag-and-drop actions for cards must provide visual feedback (shadowing and color changes) to confirm that reordering or moving between lists is successful.

## Model-to-View Integration
- The layout should closely align with the data models, where each `List` model has an array of `Card` models. The views update dynamically based on the models' data in SwiftUI using `@ObservedObject`. This ensures that any user actions like adding or reordering cards are immediately reflected in the UI and stored persistently via SwiftData.