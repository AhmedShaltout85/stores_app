# News App

A modern Flutter news application built with Provider state management.

## Features

- Browse latest news articles
- Clean and intuitive user interface
- Secure local data storage
- Multi-language support
- HTTP API integration
- Splash screen

## Tech Stack

### Framework
- **Flutter SDK**: ^3.5.3
- **Dart**: Latest stable version

### State Management
- **Provider**: ^6.1.5+1 - Robust state management solution

### Networking
- **Dio**: ^5.9.0 - Powerful HTTP client for API requests
- **HTTP**: ^1.6.0 - Additional HTTP support

### Local Storage
- **Flutter Secure Storage**: ^9.2.4 - Encrypted storage for sensitive data
- **Shared Preferences**: ^2.5.3 - Simple key-value storage

### Internationalization
- **flutter_localizations**: Built-in localization support
- **intl**: Date and number formatting

### UI/UX
- **Flutter Native Splash**: ^2.4.4 - Native splash screen
- **Cupertino Icons**: ^1.0.8 - iOS-style icons

## Getting Started

### Prerequisites

- Flutter SDK ^3.5.3 or higher
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio IDE

### Installation

1. Clone the repository:
```bash
git clone https://github.com/AhmedShaltout85/news_app_provider.git
cd news_app_provider
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate localization files:
```bash
flutter gen-l10n
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
news_app/
├── assets/
│   └── images/          # Image assets
├── lib/
│   ├── l10n/           # Localization files
│   ├── models/         # Data models
│   ├── providers/      # State management
│   ├── services/       # API services
│   ├── screens/        # UI screens
│   ├── widgets/        # Reusable widgets
│   └── main.dart       # App entry point
└── pubspec.yaml
```

## Configuration

### Adding Images
Place your images in the `assets/images/` directory. They will be automatically included in the build.

### API Configuration
Configure your news API endpoints in the services directory.

### Localization
The app supports multiple languages through Flutter's localization system. Add your translations in the `l10n` directory.

## Build

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Development

### Code Style
This project follows the official Flutter linting rules (flutter_lints ^5.0.0).

### Testing
```bash
flutter test
```

## Dependencies

For a complete list of dependencies, see [pubspec.yaml](pubspec.yaml).

## Version

Current version: **1.0.0+1**

## License

This project is private and not published to pub.dev.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Author

Ahmed Shaltout - [@AhmedShaltout85](https://github.com/AhmedShaltout85)

## Support

For issues and questions, please open an issue on the GitHub repository.