import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals_app/screens/categories.dart';
final theme = ThemeData(
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: theme,
      home: CategoriesScreeen(),
    );
  }
}

