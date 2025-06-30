# Dart Variables, Fields, and Object Construction

## The Error: "The instance member 'switchScreen' can't be accessed in an initializer"

This error occurs when you try to use an instance method during field initialization:

```dart
class _QuizState extends State<Quiz> {
  Widget activeScreen = StartScreen(switchScreen); // ❌ Error here
  
  void switchScreen() { /* ... */ }
}
```

## Types of Variables in Dart

### 1. Local Variables
Variables declared inside methods, constructors, or blocks:

```dart
void someMethod() {
  int localVar = 10;        // Local variable
  String name = "Flutter";  // Local variable
  bool isActive = true;     // Local variable
}
```

**Characteristics:**
- Exist only within their scope
- Automatically destroyed when scope ends
- Cannot be accessed from outside their scope

### 2. Instance Variables (Fields)
Variables that belong to an instance of a class:

```dart
class MyClass {
  int instanceVar = 5;      // Instance variable with initializer
  String name;              // Instance variable (uninitialized)
  late String description;  // Late instance variable
  
  MyClass(this.name);       // Constructor parameter becomes instance variable
}
```

**Characteristics:**
- Each object has its own copy
- Live as long as the object exists
- Can be accessed by all instance methods

### 3. Static Variables
Variables that belong to the class itself, not instances:

```dart
class Counter {
  static int totalCount = 0;    // Shared across all instances
  static String appName = "Quiz App";
  
  void increment() {
    totalCount++;  // Accessing static variable
  }
}

// Usage
Counter.totalCount;  // Access without creating instance
```

**Characteristics:**
- Shared across all instances of the class
- Accessed using the class name
- Only one copy exists in memory

### 4. Global Variables
Variables declared outside any class:

```dart
int globalVar = 50;           // Available everywhere
String appTitle = "My App";   // Global variable

class MyClass {
  void useGlobal() {
    print(globalVar);  // Can access global variables
  }
}
```

**Characteristics:**
- Available throughout the entire application
- Should be used sparingly
- Can cause naming conflicts

## Types of Fields in Dart

### 1. Instance Fields

```dart
class Person {
  String name;              // Mutable instance field
  int age = 0;             // Instance field with default value
  final String id;         // Immutable instance field
  
  Person(this.name, this.id);
}
```

### 2. Static Fields

```dart
class AppConfig {
  static const String version = "1.0.0";    // Compile-time constant
  static final DateTime startTime = DateTime.now();  // Runtime constant
  static int userCount = 0;                  // Mutable static field
}
```

### 3. Final Fields

```dart
class Circle {
  final double radius;      // Cannot be changed after initialization
  final double area;        // Calculated once
  
  Circle(this.radius) : area = 3.14159 * radius * radius;
}
```

### 4. Late Fields

```dart
class DataManager {
  late String data;         // Initialized later, but guaranteed before use
  late final int id;        // Late final field
  
  void initialize() {
    data = "Loaded data";
    id = generateId();
  }
  
  int generateId() => DateTime.now().millisecondsSinceEpoch;
}
```

## Instance Members

Instance members are components of a class that belong to specific instances:

```dart
class Car {
  // Instance fields
  String brand;
  int year;
  double _mileage = 0.0;    // Private field
  
  // Constructor
  Car(this.brand, this.year);
  
  // Instance methods
  void startEngine() {
    print("$brand engine started!");
  }
  
  void drive(double miles) {
    _mileage += miles;
  }
  
  // Instance getters
  String get info => "$brand ($year)";
  double get mileage => _mileage;
  
  // Instance setters
  set mileage(double value) {
    if (value >= 0) _mileage = value;
  }
}
```

**Types of Instance Members:**
- **Fields**: Store data for each instance
- **Methods**: Perform actions on instance data
- **Getters**: Provide read access to computed values
- **Setters**: Provide controlled write access to fields

## Object Construction Process

When Dart creates an object, it follows a specific sequence:

### Phase 1: Memory Allocation
```dart
// Memory is allocated for the object
// All fields are set to their default values (null, 0, false, etc.)
```

### Phase 2: Field Initialization
```dart
class _QuizState extends State<Quiz> {
  // ❌ This runs FIRST - before constructor, before methods exist
  Widget activeScreen = StartScreen(switchScreen); // switchScreen doesn't exist yet!
  
  // ✅ This works - no method reference needed
  String title = "Quiz App";
  int counter = 0;
  bool isLoading = false;
}
```

### Phase 3: Constructor Execution
```dart
class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  
  _QuizState() {
    // Constructor runs AFTER field initialization
    // Instance methods are available here
    activeScreen = StartScreen(switchScreen); // ✅ This works
  }
}
```

### Phase 4: Object Ready for Use
```dart
// Object is fully constructed and ready to use
// All methods can be called safely
```

## Visual Timeline

```
Object Creation Timeline
═══════════════════════════════════════════════════════════════

Time →
┌─────────────────┬─────────────────┬─────────────────┬─────────────────┐
│ Memory          │ Field           │ Constructor     │ Object          │
│ Allocation      │ Initialization  │ Execution       │ Ready           │
│                 │                 │                 │                 │
│ Fields = null   │ Field = value   │ Methods         │ Fully           │
│ Methods = N/A   │ Methods = N/A   │ available       │ functional      │
└─────────────────┴─────────────────┴─────────────────┴─────────────────┘
                       ↑
                   Error occurs here
```

## Why "Object Isn't Fully Constructed Yet"

During field initialization:
- The object's memory is allocated
- But the object's methods don't exist yet
- Trying to reference `switchScreen` is like trying to call a function that hasn't been defined

**Analogy**: It's like trying to call someone on a phone that hasn't been built yet!

## Solutions to the Error

### Solution 1: Use `initState()` (Recommended for Flutter)

```dart
class _QuizState extends State<Quiz> {
  Widget? activeScreen; // Nullable initially
  
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen); // ✅ Methods available now
  }
  
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: activeScreen ?? const CircularProgressIndicator(),
      ),
    );
  }
}
```

### Solution 2: Lazy Initialization with Getter

```dart
class _QuizState extends State<Quiz> {
  Widget? _activeScreen;
  
  Widget get activeScreen {
    return _activeScreen ??= StartScreen(switchScreen); // ✅ Initialized when first accessed
  }
  
  void switchScreen() {
    setState(() {
      _activeScreen = const QuestionsScreen();
    });
  }
}
```

### Solution 3: Use `late` Keyword

```dart
class _QuizState extends State<Quiz> {
  late Widget activeScreen; // ✅ Will be initialized later
  
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen); // Must initialize before first use
  }
  
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
}
```

### Solution 4: Constructor Initialization

```dart
class _QuizState extends State<Quiz> {
  Widget activeScreen;
  
  _QuizState() : activeScreen = const StartScreen(null) {
    // Later reassign with proper callback
    activeScreen = StartScreen(switchScreen);
  }
  
  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }
}
```

## Complete Fixed Code

```dart
import 'package:adv_basics/start_screen.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen; // ✅ Nullable initially
  
  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen); // ✅ Initialize here
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 96, 36, 200),
                Color.fromARGB(255, 177, 98, 255),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen ?? const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
```

## Key Takeaways

1. **Field initialization happens before methods are available**
2. **Use `initState()` for Flutter widget initialization**
3. **`late` keyword delays initialization until first use**
4. **Getters can provide lazy initialization**
5. **Understanding object construction order prevents many errors**

## Best Practices

- ✅ Initialize complex objects in `initState()`
- ✅ Use `late` for fields that will be initialized later
- ✅ Use getters for lazy initialization
- ✅ Keep field initializers simple (no method calls)
- ❌ Don't reference instance methods in field initializers
- ❌ Don't perform heavy operations in field initializers

This understanding will help you write better Dart code and avoid common initialization errors!
