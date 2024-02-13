import 'dart:math';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_meals/models/category.dart';
import 'package:favorite_meals/screens/tabs_screen.dart';

const dummyCategory = Category(
  id: 'c2',
  title: 'Quick & Easy',
  color: Colors.red,
);

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  print("TEST");

  final randomNumbers = [];

  while (randomNumbers.length < 6) {
    final number = Random().nextInt(10);

    if (randomNumbers.contains(number)) {
      continue;
    }

    randomNumbers.add(number);
  }

  print(randomNumbers);

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const TabsScreen(),
    );
  }
}
