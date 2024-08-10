import 'package:flutter/material.dart';

/// A widget that displays a color scheme with color swatches and their names.
///
/// This widget takes a [ColorScheme] and displays all the colors defined in
/// the scheme as rectangles filled with those colors, along with the names
/// of those colors. The colors are displayed in two columns.
class ColorSchemeDisplay extends StatefulWidget {
  /// The color scheme to display.
  final ColorScheme? colorScheme;

  /// The background color of the widget.
  final Color? backgroundColor;

  /// The text color for the color names.
  final Color? textColor;

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
  State<ColorSchemeDisplay> createState() => _ColorSchemeDisplayState();
}

class _ColorSchemeDisplayState extends State<ColorSchemeDisplay> {
  /// The width of each color swatch.
  final swatchWidth = 40.0;
  bool showHexCodes = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = widget.colorScheme ?? theme.colorScheme;
    final colors = _defineColors(scheme);

    final colorEntries = colors.entries.toList();
    final halfLength = (colorEntries.length / 2).ceil();

    return Material(
      child: SafeArea(
        child: Container(
          color: widget.backgroundColor ?? scheme.surface,
          child: Column(
            children: [
              SizedBox(
                width: 400,
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Text('${scheme.brightness}',
                          style: theme.textTheme.titleSmall),
                    ),
                    const Spacer(),
                    Text(
                      'show hex code',
                      style: theme.textTheme.labelMedium,
                    ),
                    Flexible(
                        fit: FlexFit.loose,
                        child: Switch(
                            value: showHexCodes,
                            onChanged: (_) {
                              setState(() => showHexCodes = !showHexCodes);
                            })),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: _renderColumn(
                          colorEntries.sublist(0, halfLength), scheme),
                    ),
                    Expanded(
                      child: _renderColumn(
                          colorEntries.sublist(halfLength), scheme),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
      color: widget.textColor ?? scheme.onSurface,
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
                    if (showHexCodes)
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
