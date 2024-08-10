import 'package:flutter/material.dart';

/// A widget that displays a color scheme with color swatches and their names.
///
/// This widget takes a [ColorScheme] and displays all the colors defined in
/// the scheme as rectangles filled with those colors, along with the names
/// of those colors. The colors are displayed in two columns.
class ColorSchemeDisplay extends StatelessWidget {
  /// The color scheme to display.
  final ColorScheme? colorScheme;

  /// The background color of the widget.
  final Color? backgroundColor;

  /// The text color for the color names.
  final Color? textColor;

  /// The width of each color swatch.
  final swatchWidth = 40.0;

  /// Creates a [ColorSchemeDisplay] widget.
  ///
  /// The [colorScheme], [backgroundColor], and [textColor] are optional.
  const ColorSchemeDisplay({
    this.colorScheme,
    this.backgroundColor,
    this.textColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = colorScheme ?? theme.colorScheme;
    final colors = _defineColors(scheme);

    final colorEntries = colors.entries.toList();
    final halfLength = (colorEntries.length / 2).ceil();

    final mediaQuery = MediaQuery.of(context);

    return Material(
      child: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        padding: const EdgeInsets.all(8),
        color: backgroundColor ?? scheme.surface,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('brightness: ${scheme.brightness}',
                    style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _renderColumn(
                        colorEntries.sublist(0, halfLength), scheme),
                  ),
                  Expanded(
                    child:
                        _renderColumn(colorEntries.sublist(halfLength), scheme),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Renders a column of color swatches and their names.
  ///
  /// Takes a list of [colorEntries] and the [scheme] to style the text.
  Widget _renderColumn(
      List<MapEntry<String, Color>> colorEntries, ColorScheme scheme) {
    final textStyle = TextStyle(
      fontSize: 12,
      color: textColor ?? scheme.onSurface,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: colorEntries.map((entry) {
        final colorName = entry.key;
        final colorHex =
            entry.value.value.toRadixString(16).padLeft(8, '0').toUpperCase();
        return Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: swatchWidth,
                color: entry.value,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SelectableText(
                      colorName,
                      style: textStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SelectableText(colorHex, style: textStyle),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  /// Defines the colors to be displayed from the given [scheme].
  ///
  /// Returns a map of color names to their corresponding [Color] values.
  Map<String, Color> _defineColors(ColorScheme scheme) => {
        'primary': scheme.primary,
        'onPrimary': scheme.onPrimary,
        'primaryContainer': scheme.primaryContainer,
        'onPrimaryContainer': scheme.onPrimaryContainer,
        'primaryFixed': scheme.primaryFixed,
        'primaryFixedDim': scheme.primaryFixedDim,
        'onPrimaryFixed': scheme.onPrimaryFixed,
        'onPrimaryFixedVariant': scheme.onPrimaryFixedVariant,
        'secondary': scheme.secondary,
        'onSecondary': scheme.onSecondary,
        'secondaryContainer': scheme.secondaryContainer,
        'onSecondaryContainer': scheme.onSecondaryContainer,
        'secondaryFixed': scheme.secondaryFixed,
        'secondaryFixedDim': scheme.secondaryFixedDim,
        'onSecondaryFixed': scheme.onSecondaryFixed,
        'onSecondaryFixedVariant': scheme.onSecondaryFixedVariant,
        'tertiary': scheme.tertiary,
        'onTertiary': scheme.onTertiary,
        'tertiaryContainer': scheme.tertiaryContainer,
        'onTertiaryContainer': scheme.onTertiaryContainer,
        'tertiaryFixed': scheme.tertiaryFixed,
        'tertiaryFixedDim': scheme.tertiaryFixedDim,
        'onTertiaryFixed': scheme.onTertiaryFixed,
        'onTertiaryFixedVariant': scheme.onTertiaryFixedVariant,
        'error': scheme.error,
        'onError': scheme.onError,
        'errorContainer': scheme.errorContainer,
        'onErrorContainer': scheme.onErrorContainer,
        'surface': scheme.surface,
        'onSurface': scheme.onSurface,
        'surfaceDim': scheme.surfaceDim,
        'surfaceBright': scheme.surfaceBright,
        'surfaceContainerLowest': scheme.surfaceContainerLowest,
        'surfaceContainerLow': scheme.surfaceContainerLow,
        'surfaceContainer': scheme.surfaceContainer,
        'surfaceContainerHigh': scheme.surfaceContainerHigh,
        'surfaceContainerHighest': scheme.surfaceContainerHighest,
        'onSurfaceVariant': scheme.onSurfaceVariant,
        'outline': scheme.outline,
        'outlineVariant': scheme.outlineVariant,
        'shadow': scheme.shadow,
        'scrim': scheme.scrim,
        'inverseSurface': scheme.inverseSurface,
        'onInverseSurface': scheme.onInverseSurface,
        'inversePrimary': scheme.inversePrimary,
        'surfaceTint': scheme.surfaceTint,
      };
}
