# Store App

A Flutter-based e-commerce store application with internationalization support and state management.

## Features

- 🛍️ E-commerce functionality
- 🌐 Multi-language support (Localization)
- 🔐 Secure local storage
- 📱 Native splash screen
- 🎨 Material Design UI
- 🔄 State management with Provider
- 🌐 HTTP networking with Dio

## Dependencies

### Core Dependencies
- **flutter_localization** (^0.3.3) - Multi-language support
- **provider** (^6.1.5+1) - State management
- **dio** (^5.9.0) - Advanced HTTP client
- **http** (^1.6.0) - HTTP requests
- **flutter_secure_storage** (^9.2.4) - Secure data storage
- **shared_preferences** (^2.5.3) - Local key-value storage
- **flutter_native_splash** (^2.4.4) - Custom splash screen
- **cupertino_icons** (^1.0.8) - iOS-style icons

## Getting Started

### Prerequisites
- Flutter SDK ^3.5.3
- Dart SDK ^3.5.3
- Android Studio / VS Code
- iOS Simulator (for Mac users) or Android Emulator

### Installation

1. Clone the repository:
```bash
git clone <your-repository-url>
cd store_app
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
store_app/
├── lib/
│   ├── main.dart
│   ├── models/
│   ├── providers/
│   ├── screens/
│   ├── services/
│   └── widgets/
├── assets/
│   └── images/
├── pubspec.yaml
└── README.md
```

## Configuration

### Assets
Images are stored in `assets/images/` directory. To add new images, place them in this folder and they will be automatically included.

### Localization
The app uses `flutter_localization` for internationalization. Generate localization files using:
```bash
flutter gen-l10n
```

### Splash Screen
Configure your splash screen in `pubspec.yaml` under the `flutter_native_splash` section.

## State Management

This app uses the **Provider** pattern for state management, offering:
- Simple and efficient state management
- Easy dependency injection
- Minimal boilerplate code

## API Integration

HTTP requests are handled using **Dio**, which provides:
- Interceptors for request/response handling
- Easy error handling
- Request cancellation
- File upload/download support

## Security

The app uses `flutter_secure_storage` for storing sensitive data like:
- Authentication tokens
- User credentials
- API keys

## Build & Release

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

## Development

### Running Tests
```bash
flutter test
```

### Code Quality
This project uses `flutter_lints` for maintaining code quality. Run:
```bash
flutter analyze
```

## Contributing

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is private and not published to pub.dev.

## Support

For issues and questions, please open an issue in the repository.

---

**Version:** 1.0.0+1  
**Flutter SDK:** ^3.5.3