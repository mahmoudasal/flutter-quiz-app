# Flutter Quiz App 🧠📱

A beautiful and interactive quiz application built with Flutter that demonstrates advanced Flutter concepts including state management, screen navigation, and widget composition.

## Features ✨

- **Interactive Start Screen**: Welcome screen with a styled quiz logo and start button
- **Dynamic Screen Navigation**: Seamless transition between start screen and quiz questions
- **Beautiful UI**: Modern gradient backgrounds and styled components
- **State Management**: Proper use of StatefulWidget for dynamic content
- **Responsive Design**: Works across different screen sizes

## App Structure 🏗️

```
lib/
├── main.dart              # App entry point
├── quiz.dart             # Main quiz widget with screen management
├── start_screen.dart     # Welcome/start screen
├── questions_screen.dart # Quiz questions interface
├── answer_button.dart    # Custom answer button widget
├── models/
│   └── quiz_question.dart # Quiz question model
└── data/
    └── questions.dart    # Quiz questions data
```

## Key Learning Points 📚

This project demonstrates several important Flutter and Dart concepts:

### 1. Widget Composition
- Custom widgets for reusable components
- Proper separation of concerns between screens

### 2. State Management
- StatefulWidget for dynamic content
- Proper state updates with `setState()`
- Screen navigation through state changes

### 3. Dart Object Construction
- Understanding instance member initialization
- Proper use of `initState()` for setup
- Avoiding common initialization errors

## Technical Implementation 🔧

### Screen Management
The app uses a single `Quiz` widget that manages the current active screen:

```dart
class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }
  
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
}
```

### UI Design
- **Gradient Backgrounds**: Beautiful purple gradient for visual appeal
- **Custom Styling**: Styled buttons, text, and images
- **Responsive Layout**: Uses Column and proper spacing

## Getting Started 🚀

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- VS Code or Android Studio
- Android/iOS simulator or physical device

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/flutter-quiz-app.git
   cd flutter-quiz-app
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the app**:
   ```bash
   flutter run
   ```

## Project Structure 📁

```
adv_basics/
├── android/          # Android-specific code
├── ios/             # iOS-specific code
├── lib/             # Main Dart code
├── assets/          # Images and resources
│   └── images/
│       └── quiz-logo.png
├── pubspec.yaml     # Dependencies and metadata
└── README.md        # Project documentation
```

## Dependencies 📦

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
```

## Learning Resources 📖

This project includes a comprehensive guide on Dart variables and object construction:
- [Dart Variables Guide](DART_VARIABLES_GUIDE.md) - Detailed explanation of variable types, fields, and object construction

## Screenshots 📸

*Coming soon*

## Contributing 🤝

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## Common Issues & Solutions 🔧

### Instance Member Error
If you encounter "The instance member 'switchScreen' can't be accessed in an initializer":
- Use `initState()` for widget initialization
- Refer to the [Dart Variables Guide](DART_VARIABLES_GUIDE.md) for detailed explanation

### Asset Loading Issues
Make sure your `pubspec.yaml` includes:
```yaml
flutter:
  assets:
    - assets/images/
```

## Future Enhancements 🔮

- [ ] Add multiple quiz categories
- [ ] Implement scoring system
- [ ] Add timer functionality
- [ ] Include sound effects
- [ ] Add animations between screens
- [ ] Implement difficulty levels

## License 📄

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author 👨‍💻

**mahmoudasal** - [GitHub Profile](https://github.com/mahmoudasal)

## Acknowledgments 🙏

- Flutter team for the amazing framework
- The Dart team for the powerful language
- Community tutorials and resources that helped in learning

---

**Happy Coding! 🚀**
