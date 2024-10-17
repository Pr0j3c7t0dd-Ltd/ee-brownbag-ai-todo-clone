# Product Requirements Document (PRD) for Trello Clone iOS App

## Introduction

This document outlines the detailed requirements for developing a Trello clone iOS app using SwiftUI and SwiftData for persistence. The app enables users to manage tasks in an organized, board-based system with an intuitive and visually appealing UI inspired by the provided images.

## Requirements

### 1. User Interface and Experience

- **Launch Screen Display**: Upon launching the app, it shall display the first board, conforming to the SwiftData persistence model.
- **Color Scheme**: The app shall use a color scheme with shades of blue and white, inspired by trello-screen.jpeg. The background will use a solid or gradient blue, while task lists and cards will have white, rounded-corner containers.
- **Layout**: The app's layout shall mimic the design presented in the provided screenshots. Lists are vertically stacked, each with a clear header such as "To Do." Each list has a button for adding new cards below the task cards.
- **Icons and Labels**: All interactive elements shall utilize intuitive icons and labels, as seen in the screenshot, for actions like adding, editing, and deleting boards, lists, and cards. The app bar shall include a settings icon, a notification icon, and a back button.
- **Responsive Design**: The app shall support both portrait and landscape orientations, adjusting the layout accordingly.
- **Drag and Drop UI Feedback**: Visual feedback shall be provided when users drag and drop cards within or between lists. This includes subtle color changes and a shadow beneath the cards.

### 2. Board Management

- **Create Board**: Users shall be able to create new boards via a dedicated "Add Board" view, accessible through an "Add" icon.
- **Edit Board**: Users shall be able to edit existing boards, including changing the board name and background color.
- **Delete Board**: Users shall be able to delete boards with a confirmation prompt to prevent accidental deletions.
- **Board Persistence**: All boards shall be saved persistently using SwiftData.
- **Board Listing**: Users shall be able to view all boards in a scrollable list or grid format on the home screen.

### 3. List Management

- **Create List**: Users shall be able to add new lists to a board through an "Add List" button positioned under the existing lists.
- **Edit List**: Users shall be able to edit list titles directly within the list header.
- **Delete List**: Users shall be able to delete lists with a confirmation prompt.
- **List Ordering**: Users shall be able to reorder lists within a board via drag and drop, with smooth visual feedback.
- **List Persistence**: All lists shall be saved persistently within their respective boards.

### 4. Card Management

- **Create Card**: Users shall be able to add new cards to a list via an "Add Card" interface positioned at the bottom of each list.
- **Edit Card**: Users shall be able to edit card details, including title, description, labels, due dates, checklists, and attachments.
- **Delete Card**: Users shall be able to delete cards with a confirmation prompt.
- **Card Ordering**: Users shall be able to reorder cards within a list via drag and drop.
- **Card Persistence**: All cards shall be saved persistently within their respective lists.

### 5. Drag and Drop Functionality

- **Drag Within List**: Users shall be able to drag and reorder cards within the same list. Cards will have a shadow and color change to indicate they are being dragged.
- **Drag Between Lists on Same Board**: Users shall be able to drag cards from one list to another within the same board.
- **Drag Between Boards**: Users shall be able to drag cards to different boards, with UI elements indicating possible drop targets.
- **Drag to Different List on Different Board**: Users shall be able to drag cards to a different list on a different board, with visual feedback indicating the transfer.
- **Drag UI Feedback**: The app shall provide visual cues during drag-and-drop actions, including a preview of the card and highlighting valid drop areas.

### 6. Additional Features

- **Checklists in Cards**: Users shall be able to add, edit, and delete checklists within cards.
- **Due Dates**: Users shall be able to assign due dates to cards, with visual icons indicating approaching due dates.
- **Attachments**: Users shall be able to attach images or files to cards from the device's photo library or file system.
- **Labels and Tags**: Users shall be able to add customizable labels to cards for categorization. The labels shall appear as colored badges at the top of each card.
- **Search Functionality**: Users shall be able to search for cards across all boards and lists.
- **Notifications**: The app shall support local notifications for upcoming due dates and reminders.
- **User Accounts (Future-proofing)**: The app's architecture shall allow for future implementation of user accounts and cloud synchronization.

### 7. Persistence and Data Management

- **SwiftData Integration**: The app shall use SwiftData for all data persistence, ensuring data is retained between sessions.
- **Data Integrity**: The app shall ensure data consistency during concurrent operations, such as simultaneous edits and drag-and-drop actions.
- **Data Models**: The app shall have well-defined data models for boards, lists, and cards, adhering to Swift best practices.

### 8. Technical Specifications

- **SwiftUI Framework**: The app shall be developed entirely using SwiftUI for the user interface, with animations and transitions.
- **iOS Compatibility**: The app shall support devices running iOS 17 and later.
- **Performance Optimization**: The app shall maintain smooth performance, with animations and transitions operating at 60 frames per second.
- **Error Handling**: The app shall handle errors gracefully, providing user-friendly messages and preventing crashes.
- **Accessibility Compliance**: The app shall comply with accessibility standards, supporting VoiceOver and Dynamic Type.

### 9. Project Structure

- **Folder Organization**: The project shall adhere to the following folder structure:
  - App: Contains the main App file.
  - Models: Contains data model definitions.
  - Views: Contains all SwiftUI view files.
  - ViewModels: Contains view model classes.
  - Resources: Contains assets like images and color sets.
  - Utilities: Contains helper classes and extensions.
  - Services: Contains data management and other service classes.
- **Code Conventions**: The codebase shall follow Swift and SwiftUI best practices, including naming conventions, access control, and documentation comments.

### 10. Pseudocode Examples

#### Main App File Update:

```swift
@main
struct TrelloCloneApp: App {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(entity: Board.entity(), sortDescriptors: [])
    private var boards: FetchedResults<Board>

    var body: some Scene {
        WindowGroup {
            if let firstBoard = boards.first {
                BoardView(board: firstBoard)
            } else {
                EmptyStateView()
            }
        }
    }
}
```

#### Data Models:

```swift
// Board Model
@Model
class Board: Identifiable {
    var id: UUID = UUID()
    var name: String
    var lists: [List] = []
    // Additional properties
}

// List Model
@Model
class List: Identifiable {
    var id: UUID = UUID()
    var title: String
    var cards: [Card] = []
    // Additional properties
}

// Card Model
@Model
class Card: Identifiable {
    var id: UUID = UUID()
    var title: String
    var description: String?
    var labels: [Label] = []
    var dueDate: Date?
    var checklistItems: [ChecklistItem] = []
    // Additional properties
}
```

#### Views for Adding and Editing:

- Add/Edit Board View: `AddEditBoardView`
- Add/Edit List View: `AddEditListView`
- Add/Edit Card View: `AddEditCardView`
- Card Detail View: `CardDetailView`

#### Drag and Drop Implementation:

- Use SwiftUI's `onDrag` and `onDrop` modifiers to handle drag-and-drop interactions.
- Implement `DropDelegate` to manage the drop logic between lists and boards.