# Flutter Light & Dark Theme Demo

A simple Flutter application demonstrating how to implement **Light and Dark Theme switching** with persistent local storage using `shared_preferences`.

## Features

- 🌞 Light Theme
- 🌙 Dark Theme
- 🔄 Real-time theme switching
- 💾 Saves theme preference locally
- 🚀 Restores selected theme on app startup
- 🎨 Material 3 design support

## Screenshots

### Light Mode

<p align="center">
  <img src="lib/screenshots/light.png" width="300">
</p>

### Dark Mode

<p align="center">
  <img src="lib/screenshots/dark.png" width="300">
</p>

## Technologies Used

- Flutter
- Dart
- shared_preferences

## Getting Started

### Clone the repository

```bash
git clone https://github.com/amtshirazu/flutter---dark_and_light_theme_demo.git
```

### Navigate to the project

```bash
cd flutter---dark_and_light_theme_demo
```

### Install dependencies

```bash
flutter pub get
```

### Run the app

```bash
flutter run
```

## Package Used

```yaml
shared_preferences:
```

## How It Works

The app:

1. Loads the saved theme preference during startup.
2. Uses `ValueNotifier` and `ValueListenableBuilder` for reactive UI updates.
3. Saves the selected theme using `shared_preferences`.
4. Automatically restores the saved theme when the app restarts.

## Project Structure

```text
lib/
 ├── screenshots/
 │    ├── light.png
 │    └── dark.png
 └── main.dart
```

## Author

Created by Abdul-Muhsin Tiyumba Shirazu
