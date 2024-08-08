import 'package:flutter/material.dart';

class ColorSchemeDisplay extends StatelessWidget {
  final ColorScheme colorScheme;
  final Color? backgroundColor;
  final Color? textColor;
  final swatchWidth = 40.0;

  const ColorSchemeDisplay(
      {required this.colorScheme,
      this.backgroundColor,
      this.textColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    final colors = defineColors();

    final theme = Theme.of(context);

    final colorEntries = colors.entries.toList();
    final halfLength = (colorEntries.length / 2).ceil();

    final mediaQuery = MediaQuery.of(context);

    return Material(
      child: Container(
        width: mediaQuery.size.width,
        height: mediaQuery.size.height,
        padding: const EdgeInsets.all(8),
        color: backgroundColor ?? colorScheme.surface,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('brightness: ${colorScheme.brightness}',
                    style: theme.textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: renderColumn(colorEntries.sublist(0, halfLength)),
                  ),
                  Expanded(
                    child: renderColumn(colorEntries.sublist(halfLength)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  renderColumn(List<MapEntry<String, Color>> colorEntries) {
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
                      color: textColor ?? colorScheme.onSurface,
                    )),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Map<String, Color> defineColors() => {
        'primary': colorScheme.primary,
        'onPrimary': colorScheme.onPrimary,
        'primaryContainer': colorScheme.primaryContainer,
        'onPrimaryContainer': colorScheme.onPrimaryContainer,
        'primaryFixed': colorScheme.primaryFixed,
        'primaryFixedDim': colorScheme.primaryFixedDim,
        'onPrimaryFixed': colorScheme.onPrimaryFixed,
        'onPrimaryFixedVariant': colorScheme.onPrimaryFixedVariant,
        'secondary': colorScheme.secondary,
        'onSecondary': colorScheme.onSecondary,
        'secondaryContainer': colorScheme.secondaryContainer,
        'onSecondaryContainer': colorScheme.onSecondaryContainer,
        'secondaryFixed': colorScheme.secondaryFixed,
        'secondaryFixedDim': colorScheme.secondaryFixedDim,
        'onSecondaryFixed': colorScheme.onSecondaryFixed,
        'onSecondaryFixedVariant': colorScheme.onSecondaryFixedVariant,
        'tertiary': colorScheme.tertiary,
        'onTertiary': colorScheme.onTertiary,
        'tertiaryContainer': colorScheme.tertiaryContainer,
        'onTertiaryContainer': colorScheme.onTertiaryContainer,
        'tertiaryFixed': colorScheme.tertiaryFixed,
        'tertiaryFixedDim': colorScheme.tertiaryFixedDim,
        'onTertiaryFixed': colorScheme.onTertiaryFixed,
        'onTertiaryFixedVariant': colorScheme.onTertiaryFixedVariant,
        'error': colorScheme.error,
        'onError': colorScheme.onError,
        'errorContainer': colorScheme.errorContainer,
        'onErrorContainer': colorScheme.onErrorContainer,
        'surface': colorScheme.surface,
        'onSurface': colorScheme.onSurface,
        'surfaceDim': colorScheme.surfaceDim,
        'surfaceBright': colorScheme.surfaceBright,
        'surfaceContainerLowest': colorScheme.surfaceContainerLowest,
        'surfaceContainerLow': colorScheme.surfaceContainerLow,
        'surfaceContainer': colorScheme.surfaceContainer,
        'surfaceContainerHigh': colorScheme.surfaceContainerHigh,
        'surfaceContainerHighest': colorScheme.surfaceContainerHighest,
        'onSurfaceVariant': colorScheme.onSurfaceVariant,
        'outline': colorScheme.outline,
        'outlineVariant': colorScheme.outlineVariant,
        'shadow': colorScheme.shadow,
        'scrim': colorScheme.scrim,
        'inverseSurface': colorScheme.inverseSurface,
        'onInverseSurface': colorScheme.onInverseSurface,
        'inversePrimary': colorScheme.inversePrimary,
        'surfaceTint': colorScheme.surfaceTint,
      };
}
