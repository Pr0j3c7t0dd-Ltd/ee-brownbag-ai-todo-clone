# Product Requirements Document (PRD): Trello Clone iOS App

## 1. General Requirements

1.1. The app shall be developed for iOS 18 using SwiftUI and SwiftData for persistence.

1.2. The app shall adhere to best practices for Swift and SwiftUI, including proper folder structure in the project.

1.3. The app's user interface (UI) shall be intuitive and visually appealing, based on the attached reference image.

## 2. Boards

### 2.1. Creation

2.1.1. The app shall allow users to create new boards.

2.1.2. Users shall be able to input a name when creating a new board.

2.1.3. The app shall provide a clean interface with icons and labels for adding a new board.

### 2.2. Editing

2.2.1. The app shall allow users to edit existing boards.

2.2.2. Users shall be able to change the name of a board.

2.2.3. The app shall provide a clean interface with icons and labels for editing a board.

### 2.3. Deletion

2.3.1. The app shall allow users to delete boards.

2.3.2. Users shall receive a confirmation prompt before a board is deleted.

## 3. Lists

### 3.1. Creation

3.1.1. The app shall allow users to create new lists within a board.

3.1.2. Users shall be able to input a name when creating a new list.

3.1.3. The app shall provide a clean interface with icons and labels for adding a new list.

### 3.2. Editing

3.2.1. The app shall allow users to edit existing lists.

3.2.2. Users shall be able to change the name of a list.

3.2.3. The app shall provide a clean interface with icons and labels for editing a list.

### 3.3. Deletion

3.3.1. The app shall allow users to delete lists.

3.3.2. Users shall receive a confirmation prompt before a list is deleted.

## 4. Cards

### 4.1. Creation

4.1.1. The app shall allow users to create new cards within a list.

4.1.2. Users shall be able to input a title and description when creating a new card.

4.1.3. The app shall provide a clean interface with icons and labels for adding a new card.

### 4.2. Editing

4.2.1. The app shall allow users to edit existing cards.

4.2.2. Users shall be able to change the title and description of a card.

4.2.3. The app shall provide a clean interface with icons and labels for editing a card.

### 4.3. Deletion

4.3.1. The app shall allow users to delete cards.

4.3.2. Users shall receive a confirmation prompt before a card is deleted.

## 5. Drag and Drop Functionality

### 5.1. Within the Same List

5.1.1. Users shall be able to drag and drop cards to reorder them within the same list.

### 5.2. Between Lists on the Same Board

5.2.1. Users shall be able to drag and drop cards from one list to another on the same board.

### 5.3. Between Boards

5.3.1. Users shall be able to drag and drop cards to a different board.

5.3.2. Users shall be able to drag and drop cards to a different list on a different board.

### 5.4. Smooth Interaction

5.4.1. The drag and drop functionality shall be smooth and responsive.

## 6. User Interface

6.1. The app shall use icons and labels consistently across all views for adding, editing, and deleting boards, lists, and cards.

6.2. The interface for adding, editing, and deleting shall be clean and intuitive.

6.3. The app shall follow iOS 18 design guidelines for visual elements and interactions.

## 7. Data Persistence

7.1. The app shall use SwiftData to persist all user data locally on the device.

7.2. All changes made by the user shall be saved automatically without requiring manual actions.

## 8. Performance

8.1. The app shall load boards, lists, and cards quickly without noticeable delays.

8.2. Drag and drop operations shall be executed without lag.

## 9. Compatibility

9.1. The app shall be compatible with all devices running iOS 18.

## 10. Error Handling

10.1. The app shall display user-friendly error messages for any operation that fails.

## 11. Testing

11.1. Each requirement shall be tested to ensure it functions as specified.

11.2. Drag and drop functionality shall be tested across all scenarios mentioned.