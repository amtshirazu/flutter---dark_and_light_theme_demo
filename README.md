# 🌗 Flutter Light & Dark Theme Demo

A clean and simple Flutter application that demonstrates how to implement **Light & Dark Theme switching** with persistent local storage using `shared_preferences`.

## ✨ Features

- 🌞 Light Theme Support
- 🌙 Dark Theme Support
- 🔄 Instant Theme Switching
- 💾 Persistent Theme Saving
- 🚀 Automatically Restores Theme on App Launch
- 🎨 Built with Material 3

---

## 📱 Preview

The app allows users to switch between light and dark mode using a toggle switch.  
The selected theme is stored locally and restored whenever the app restarts.

---

## 🛠️ Technologies Used

- Flutter
- Dart
- shared_preferences

---

## 📦 Installation

### 1️⃣ Clone the repository

```bash
git clone https://github.com/amtshirazu/flutter---dark_and_light_theme_demo.git
```

### 2️⃣ Navigate into the project

```bash
cd flutter---dark_and_light_theme_demo
```

### 3️⃣ Install dependencies

```bash
flutter pub get
```

### 4️⃣ Run the application

```bash
flutter run
```

---

## 📚 Package Used

```yaml
dependencies:
  shared_preferences: ^2.2.2
```

---

## 🧠 How It Works

- The app checks the saved theme preference on startup.
- `ValueNotifier` is used for lightweight state management.
- Theme changes update the UI instantly.
- `shared_preferences` stores the selected theme locally.
- The saved theme is restored automatically when reopening the app.

---

## 📂 Project Structure

```text
lib/
 └── main.dart
```

---

## 👨‍💻 Author

**Abdul-Muhsin Tiyumba Shirazu**

GitHub: https://github.com/amtshirazu

---

## ⭐ If you found this project useful

Give the repository a star ⭐ on GitHub.
