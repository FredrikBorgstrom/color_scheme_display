import 'package:color_scheme_display/color_scheme_display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xFF2FB2B2),
        brightness: Brightness.light,
        dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot);
    return MaterialApp(
      title: 'Color Scheme Display Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const ColorSchemeDisplay(),
    );
  }
}
