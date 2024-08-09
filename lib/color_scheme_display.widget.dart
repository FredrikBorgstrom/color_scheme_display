import 'package:flutter/material.dart';

class ColorSchemeDisplay extends StatelessWidget {
  final ColorScheme? colorScheme;
  final Color? backgroundColor;
  final Color? textColor;
  final swatchWidth = 40.0;

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
    final colors = defineColors(scheme);

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
                    child: _renderColumn(colorEntries.sublist(0, halfLength), scheme),
                  ),
                  Expanded(
                    child: _renderColumn(colorEntries.sublist(halfLength), scheme),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _renderColumn(List<MapEntry<String, Color>> colorEntries, ColorScheme scheme) {
    return Column(
      children: colorEntries.map((entry) {
        return Expanded(
          child: Row(
            children: [
              Container(
                width: swatchWidth,
                color: entry.value,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(entry.key,
                    style: TextStyle(
                      fontSize: 12,
                      color: textColor ?? scheme.onSurface,
                    )),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Map<String, Color> defineColors(ColorScheme scheme) => {
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
