# Product Requirements

## Introduction

This document outlines the requirements for a task management app using SwiftUI and SwiftData. The app will allow users to create and manage boards, lists, and cards, with a modern UI inspired by Trello.

## 1. User Interface

- **Responsive Design**: The layout must adapt between portrait and landscape orientations, adjusting list and card positions accordingly.
- **Drag and Drop**: Cards must be draggable within lists or between lists, with visual feedback to confirm movement.
- **Color Scheme**: A blue and white color scheme will dominate the interface, providing contrast between interactive elements.

## 2. Board, List, and Card Management

### Board Management
- **Create Board**: A user can create a new board, which will be stored persistently.
- **Edit Board**: Users can rename boards and adjust background colors.
- **Delete Board**: Boards can be deleted with confirmation.

### List Management
- **Create List**: New lists can be added to a board. Lists are arranged vertically, and users can edit titles or reorder them.
- **List Persistence**: All lists are saved using SwiftData.

### Card Management
- **Create Card**: Cards can be added to lists via a button. Cards consist of a title and optional description.
- **Edit and Delete Card**: Cards can be edited or deleted, with persistent changes reflected in SwiftData.
- **Card Reordering**: Users can reorder cards within or between lists, with model updates reflected in the UI.

## 3. SwiftUI Views and Model Binding

Each view is tied to a specific model (`Board`, `List`, or `Card`) and updates dynamically using SwiftUI's `@ObservedObject`. For example:
- `BoardView` renders a board and its lists.
- `ListView` renders the lists and handles drag-and-drop functionality for cards.
- `CardView` displays individual cards, allowing edits or reordering.

## 4. Persistence and Data Management

All user actions (e.g., card reordering, list creation) are saved using SwiftData. Ensure that drag-and-drop interactions are smoothly integrated into the data model without conflicts.