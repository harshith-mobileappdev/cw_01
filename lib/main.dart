
import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const RunMyApp());
}

class RunMyApp extends StatefulWidget {
  const RunMyApp({super.key});

  @override
  State<RunMyApp> createState() => _RunMyAppState();
}

class _RunMyAppState extends State<RunMyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  int _counter = 0; // Counter variable
  int _backgroundIndex = 0; // Background image index

  // Method to toggle between light and dark themes
  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  // Method to increment the counter
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _resetCounter() {
    setState(() {
      _backgroundIndex = 0; // Toggle between 0 and 1
    });
    setState(() {
      _counter = 0;
    });
  }

  // Method to toggle background image
  void _toggleBackground() {
    setState(() {
      _backgroundIndex = (_backgroundIndex + 1) % 2; // Toggle between 0 and 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        toggleTheme: _toggleTheme,
        themeMode: _themeMode,
        counter: _counter,
        incrementCounter: _incrementCounter,
        toggleBackground: _toggleBackground,
        backgroundIndex: _backgroundIndex,
          resetCounter: _resetCounter,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Function toggleTheme;
  final ThemeMode themeMode;
  final int counter;
  final Function incrementCounter;
  final Function toggleBackground;
  final Function resetCounter;
  final int backgroundIndex;

  const HomeScreen({
    Key? key,
    required this.toggleTheme,
    required this.themeMode,
    required this.counter,
    required this.incrementCounter,
    required this.toggleBackground,
    required this.backgroundIndex,
    required this.resetCounter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define the image path based on the backgroundIndex
    String imagePath = backgroundIndex == 0
        ? 'assets/disney.png'
        : 'assets/marvel.png';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this\n$counter times',
              style: const TextStyle(fontSize: 20, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Space between counter and image
            // Display the selected image
            Image.asset(
              imagePath,
              width: 200, // Adjust width as needed
              height: 200, // Adjust height as needed
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Increment button
          FloatingActionButton(
            onPressed: () => incrementCounter(),
            child: Text('incre'),
          ),
          const SizedBox(width: 16), // Space between buttons
          // Toggle background button
          FloatingActionButton(
            onPressed: () => toggleBackground(),
            child: const Text('toggle'),
          ),
          const SizedBox(width: 16), // Space between buttons
          // Reset button
          FloatingActionButton(
            onPressed: () => resetCounter(),
            child: const Icon(Icons.refresh),
            backgroundColor: Colors.lightBlue, // Optional: make the reset button red
          ),
        ],
      ),
    );
  }
}


