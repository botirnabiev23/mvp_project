# MVP Project - Rick & Morty Character Explorer 🚀

A modern Flutter application showcasing clean architecture principles, offline-first capabilities, and state management with BLoC pattern. Browse and favorite characters from the Rick & Morty universe!

## ✨ Features

- **Character Browsing** - Explore characters from the Rick & Morty API with pagination
- **Favorites** - Mark characters as favorites and access them anytime
- **Offline Support** - Full offline functionality with local database caching using Drift
- **Dark/Light Theme** - Toggle between dark and light themes
- **Clean Architecture** - Well-structured codebase following clean architecture principles
- **Responsive UI** - Beautiful and responsive user interface

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                    # Core functionality shared across features
│   ├── di/                  # Dependency injection setup
│   ├── error/               # Error handling and failures
│   ├── theme/               # Theme management
│   └── usecases/            # Base use case classes
├── db/                      # Database configuration and tables (Drift)
├── feature/                 # Feature-based organization
│   ├── characters/          # Character browsing feature
│   │   ├── data/           # Data layer (models, repositories, data sources)
│   │   ├── domain/         # Domain layer (entities, repository interfaces, use cases)
│   │   └── presentation/   # Presentation layer (BLoC, UI widgets)
│   ├── favourite/          # Favorites feature
│   └── main/               # Main page/shell
└── router/                 # App routing configuration
```

### Layers

- **Presentation Layer**: BLoC for state management, UI widgets
- **Domain Layer**: Business logic, use cases, entities
- **Data Layer**: Repository implementations, data sources (remote & local), models

## 🛠️ Tech Stack

- **Framework**: Flutter 3.9.2+
- **State Management**: flutter_bloc + equatable
- **Routing**: go_router
- **Networking**: dio
- **Database**: drift (SQLite)
- **Dependency Injection**: get_it
- **Functional Programming**: dartz (Either type)
- **Image Caching**: cached_network_image
- **Serialization**: json_annotation + freezed

## 📋 Prerequisites

- Flutter SDK 3.9.2 or higher
- Dart SDK 3.9.2 or higher
- Android Studio / VS Code / IntelliJ IDEA
- Android SDK (for Android development)
- Xcode (for iOS development, macOS only)

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/botirnabiev23/mvp_project.git
cd mvp_project
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Generate code (for Drift database and JSON serialization)

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Run the app

```bash
flutter run
```

## 📱 Features Walkthrough

### Character List
Browse through all Rick & Morty characters with smooth pagination. The app fetches data from the API and caches it locally for offline access.

### Favorites
Tap the heart icon to add characters to your favorites. All favorites are stored locally and persist across app sessions.

### Offline Mode
All viewed characters are cached automatically. You can browse previously loaded characters even without an internet connection.

### Theme Switching
Toggle between light and dark themes using the theme switcher in the app bar.

## 🧪 Testing

Run tests using:

```bash
flutter test
```

## 📦 Build

### Android APK
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](https://github.com/botirnabiev23/mvp_project/issues).

## 📄 License

This project is licensed under the MIT License.

## 👤 Author

**Botir Nabiev**
- GitHub: [@botirnabiev23](https://github.com/botirnabiev23)

## 🙏 Acknowledgments

- [Rick and Morty API](https://rickandmortyapi.com/) for providing the character data
- Flutter community for amazing packages and support

---

Made with ❤️ using Flutter
