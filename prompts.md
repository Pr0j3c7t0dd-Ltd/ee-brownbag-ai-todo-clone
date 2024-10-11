[With o1-preview in ChatGPT interface..]

You are an expert App Product Owner.  I would like you to write a detailed PRD document that details the requirements for a Trello clone iOS app using SwiftUI and SwiftData for persistence. This app should allow users to manage tasks in an organized way, similar to Trello's board-based task management system. Users should be able to create, view, and manage tasks through an intuitive, visually appealing UI. Use the trello-screen.jpeg image as inspiration for the color and layout of the app. Write the output in a markdown file format. Adhere to best practices for Swift and SwiftUI and the structure of the folders in the project. Put all your recommendations for folder structure and code.  You can write psudo code for the models, views, and functionality.

Add drag and drop functionality to the cards in the app. The cards should be able to be dragged from one list to another. The cards should be able to be dragged within the same list. The cards should be able to be dragged to a different board. The cards should be able to be dragged to a different list on a different board.

Update the main App file to show the first board, ensure that it also conforms to the persistance model in SwiftData.

Make sure there are views for adding and editing new board, a new list, a new card, and editing a card.

Make sure there is a clean interface for adding, editing and deleting a board, a list, a card. including the use of icons and labels.

Add additional features that you would expect from a Trello clone app.

Pay attention to the colors and layout of the app. Use the @trello-screen.jpeg image as inspiration for the color and layout of the app.

Do not output any explinations, however, write all the requrements.  Make sure each requirement is well defined and testable.  Make sure each requirement is numbered in the document.

[Switch to GPT-4o, upload screenshot]

Now merge the requiements with this screenshot to detail the correct visual appearance.  Double check that you met all the original requirements and write out a new version of the PRD.

[Switch to Claude, copy and paset the PRD text from OpenAI]
create a md file of this input:

[copy md into requirements.md file]

---

You are an expert iOS developer. Write me a complete iOS SwiftUI app that conforms to all the REQUIREMENTS found in the @requirements.md file. Ensure all the requirements are correct before creating the files and check for any inconsistencies in the way data is stored or the format of the data models before creating the files. Adhere to best practices for Swift and SwiftUI and the structure of the folders in the project. Think step by step to ensure the models and data storage work together.

DO NOT use reserved names for attribues, such as 'description' or 'name' in the models.
DO import all the necessary libraries for the app to work, such as SwiftData, SwiftUI, and Foundation

ALWAYS make sure Models conform to the ObservableObject protocol.
ALWAYS make sure Models conform to the Identifiable protocol.
ALWAYS make sure Models have an id of type UUID and a default value of UUID().
ALWAYS make sure Models NO NOT a @Relationship to any other model.

ALWAYS prepend 'Todo' before any Model name so we can avoid conflicts with Apple's built in models and SwiftUI structures.

Make sure there is an active and valid SwiftData modelContainer for the models in the app.

DO NOT use CoreData in the app. Use SwiftData.

DO NOT use the Predicate macro in the models.

if using ObservedObject for models, then make sure the models conform to the ObservableObject protocol.

Make sure there are no circular references in the model relationships.
Make sure all the relationships, including the .cascade delete rule, are set correctly.

Update the main App file to show the first board, ensure that it also conforms to the persistance model in SwiftData.

---

You are an expert developer and Quality Assurance auditor. You are given a set of REQUIREMENTS for an app found in @requirements.md file. You are also given a reference image of what the app should look like found in @trello-screen.jpeg. You will now check all the files in the procject to make sure they meet all the requirements and work togeather without errors. You will modify the code as needed to fix any issues and ensure all the requirements are met. You will also add any additional code needed to make the app work. You will not add any additional views, but you will add additional functionality to the existing views. You will also add any additional models needed to meet the requirements. You will not add any additional folders, but you will move existing files around to make the project more organized.

---
