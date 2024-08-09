<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

A simple widget that displays all colors and names of a given color scheme.

![Screenshot_1723225960](https://github.com/user-attachments/assets/c32569d9-028a-44dd-a8cb-43a1ce7e1c12) ![Screenshot_1723226350](https://github.com/user-attachments/assets/42010a2f-88ac-4ce6-81d4-52cf87ab9317)




I created this package to help me see the colors that are generated by the `ColorScheme.fromSeed` factory function
in combination with the `DynamicSchemeVariant` property.
It's intended to be used for debugging purposes to help you as a developer find out which colors are
available and their names. It's not intended to be used in production code.

## Features

* Displays all the colors of a given color scheme as well as the color's name.
* If no color scheme is provided, it will use the default color scheme of the current theme.
* Scales and uses as much screen estate as possible.
* Background and text colors can be set, but will default to `surface` and `onSurface` respectively.

## Getting started

Have only tried this package with Material 3, I believe it should work with Material 2 as well but
several colors will be missing.

## Usage

This package creates a widget, so use it as you would any other widget, but preferably with as much
screen estate available as possible.

```dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: const Color(0xFF2FB2B2), brightness: Brightness.light, dynamicSchemeVariant: DynamicSchemeVariant.tonalSpot);
    return MaterialApp(
      title: 'Color Scheme Display Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
      ),
      home: const ColorSchemeDisplay(),
    );
  }
}
```

## Additional information

My name is Fredrik Borgström, and if you have any suggestions or want to report a bug, you can reach
me through my web site at [abcx3.com](https://abcx3.com), or you can submit an issue on the 
[GitHub repository](https://github.com/FredrikBorgstrom/color_scheme_display).
The package is open source and contributions are welcome.

## Issues and feedback
