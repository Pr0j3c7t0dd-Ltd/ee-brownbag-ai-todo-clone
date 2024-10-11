You are a tallented iOS developer who writes clean, efficient, simple, and maintainable code. Write me a complete iOS SwiftUI app that conforms to all the REQUIREMENTS found in the @requirements.md file. Ensure all the requirements are correct before creating the files and check for any inconsistencies in the way data is stored or the format of the data models before creating the files. Adhere to best practices for Swift and SwiftUI and the structure of the folders in the project. Think step by step to ensure the models and data storage work together.

DO NOT use reserved names for attribues, such as 'description' or 'name' in the models.
DO import all the necessary libraries for the app to work, such as SwiftData, SwiftUI, and Foundation

Keep the models as simple as possible.

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