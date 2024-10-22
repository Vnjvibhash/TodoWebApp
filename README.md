# Todo App

A simple and intuitive Todo List app built with Flutter. This app allows users to add, edit, mark as done, and delete tasks efficiently. It leverages the `Provider` package for state management to ensure smooth and scalable performance.

## Features

- **Add Todos**: Add a new todo to the list by typing in the text field and tapping the add button.
- **Edit Todos**: Modify an existing todo by tapping the edit icon next to it.
- **Mark Todos as Complete/Incomplete**: Toggle the status of a todo (complete or incomplete) by tapping the circle/check icon.
- **Delete Todos**: Remove a todo from the list by tapping the delete icon.
- **Real-time Updates**: The list updates in real-time using the `Provider` state management solution.

## Screenshots

![Todo List Screenshot](path-to-screenshot.png)

## Getting Started

### Prerequisites

Ensure you have the following installed on your local machine:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- A suitable IDE such as [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/todoapp.git
   cd todoapp
   ```

2. **Install dependencies:**: Run the following command to install the necessary dependencies listed in pubspec.yaml:
   ```bash
   flutter pub get
   ```

3. **Run the app**: Connect an emulator or a physical device and run:
   ```bash
   flutter run
   ```

## Project Structure
   ```bash
    lib/
    ├── data/
    │   ├── models/
    │   │   └── todo.dart
    │   └── provider/
    │       └── todo_provider.dart
    ├── screen/
    │   └── home_screen.dart
    └── main.dart
   ```
