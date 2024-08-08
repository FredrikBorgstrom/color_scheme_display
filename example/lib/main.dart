import 'package:color_scheme_display/color_scheme_display.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // TRY THIS: Try changing the colorScheme here to a different colorScheme
    final colorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF2FB2B2), brightness: Brightness.light, dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot);
    return MaterialApp(
      title: 'Color Scheme Display Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: ColorSchemeDisplay(colorScheme: colorScheme),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      *//*appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),*//*
      body: ColorSchemeDisplay(colorScheme:  Theme.of(context).colorScheme),
    );
  }
}*/
