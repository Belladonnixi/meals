import 'package:flutter/material.dart';
import 'package:meals_2/screens/tabs.dart';
import 'package:meals_2/settings/color_themes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const TabsScreen(),
    );
  }
}
