import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff96005f),
      surfaceTint: Color(0xffb31374),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbb1d7a),
      onPrimaryContainer: Color(0xffffd8e6),
      secondary: Color(0xff006b5c),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff79f0d8),
      onSecondaryContainer: Color(0xff006d5e),
      tertiary: Color(0xff4c42c9),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff655de3),
      onTertiaryContainer: Color(0xfff7f3ff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff25181d),
      onSurfaceVariant: Color(0xff574149),
      outline: Color(0xff8a707a),
      outlineVariant: Color(0xffddbec9),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3b2c32),
      inversePrimary: Color(0xffffafd1),
      primaryFixed: Color(0xffffd8e6),
      onPrimaryFixed: Color(0xff3d0024),
      primaryFixedDim: Color(0xffffafd1),
      onPrimaryFixedVariant: Color(0xff8b0058),
      secondaryFixed: Color(0xff80f7df),
      onSecondaryFixed: Color(0xff00201b),
      secondaryFixedDim: Color(0xff62dac3),
      onSecondaryFixedVariant: Color(0xff005045),
      tertiaryFixed: Color(0xffe3dfff),
      onTertiaryFixed: Color(0xff110068),
      tertiaryFixedDim: Color(0xffc4c0ff),
      onTertiaryFixedVariant: Color(0xff3a2db8),
      surfaceDim: Color(0xffebd4db),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f3),
      surfaceContainer: Color(0xffffe8ef),
      surfaceContainerHigh: Color(0xfffae2e9),
      surfaceContainerHighest: Color(0xfff4dce4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff6d0044),
      surfaceTint: Color(0xffb31374),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffbb1d7a),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff003e35),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff007b6a),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2812a8),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff625ae0),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff190e13),
      onSurfaceVariant: Color(0xff453039),
      outline: Color(0xff634c55),
      outlineVariant: Color(0xff806670),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3b2c32),
      inversePrimary: Color(0xffffafd1),
      primaryFixed: Color(0xffc62983),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xffa50069),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff007b6a),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff006053),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff625ae0),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff493fc6),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd7c1c8),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffff0f3),
      surfaceContainer: Color(0xfffae2e9),
      surfaceContainerHigh: Color(0xffeed7de),
      surfaceContainerHighest: Color(0xffe3ccd3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff5b0038),
      surfaceTint: Color(0xffb31374),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff90005b),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00332b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff005347),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1e0098),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3d30ba),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff3a262f),
      outlineVariant: Color(0xff5a434c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff3b2c32),
      inversePrimary: Color(0xffffafd1),
      primaryFixed: Color(0xff90005b),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff670040),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff005347),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003a31),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3d30ba),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff2408a5),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc9b3ba),
      surfaceBright: Color(0xfffff8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffffecf1),
      surfaceContainer: Color(0xfff4dce4),
      surfaceContainerHigh: Color(0xffe6cfd6),
      surfaceContainerHighest: Color(0xffd7c1c8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffafd1),
      surfaceTint: Color(0xffffafd1),
      onPrimary: Color(0xff63003d),
      primaryContainer: Color(0xffbb1d7a),
      onPrimaryContainer: Color(0xffffd8e6),
      secondary: Color(0xffe0fff6),
      onSecondary: Color(0xff00382f),
      secondaryContainer: Color(0xff79f0d8),
      onSecondaryContainer: Color(0xff006d5e),
      tertiary: Color(0xffc4c0ff),
      onTertiary: Color(0xff2101a3),
      tertiaryContainer: Color(0xff655de3),
      onTertiaryContainer: Color(0xfff7f3ff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff1c1015),
      onSurface: Color(0xfff4dce4),
      onSurfaceVariant: Color(0xffddbec9),
      outline: Color(0xffa58993),
      outlineVariant: Color(0xff574149),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff4dce4),
      inversePrimary: Color(0xffb31374),
      primaryFixed: Color(0xffffd8e6),
      onPrimaryFixed: Color(0xff3d0024),
      primaryFixedDim: Color(0xffffafd1),
      onPrimaryFixedVariant: Color(0xff8b0058),
      secondaryFixed: Color(0xff80f7df),
      onSecondaryFixed: Color(0xff00201b),
      secondaryFixedDim: Color(0xff62dac3),
      onSecondaryFixedVariant: Color(0xff005045),
      tertiaryFixed: Color(0xffe3dfff),
      onTertiaryFixed: Color(0xff110068),
      tertiaryFixedDim: Color(0xffc4c0ff),
      onTertiaryFixedVariant: Color(0xff3a2db8),
      surfaceDim: Color(0xff1c1015),
      surfaceBright: Color(0xff44353b),
      surfaceContainerLowest: Color(0xff160b10),
      surfaceContainerLow: Color(0xff25181d),
      surfaceContainer: Color(0xff291c21),
      surfaceContainerHigh: Color(0xff34262c),
      surfaceContainerHighest: Color(0xff403136),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffd0e1),
      surfaceTint: Color(0xffffafd1),
      onPrimary: Color(0xff4f0030),
      primaryContainer: Color(0xfff551a8),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffe0fff6),
      onSecondary: Color(0xff00382f),
      secondaryContainer: Color(0xff79f0d8),
      onSecondaryContainer: Color(0xff004d42),
      tertiary: Color(0xffdcd8ff),
      onTertiary: Color(0xff190085),
      tertiaryContainer: Color(0xff8781ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff1c1015),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff4d4df),
      outline: Color(0xffc8aab4),
      outlineVariant: Color(0xffa58993),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff4dce4),
      inversePrimary: Color(0xff8e005a),
      primaryFixed: Color(0xffffd8e6),
      onPrimaryFixed: Color(0xff2a0018),
      primaryFixedDim: Color(0xffffafd1),
      onPrimaryFixedVariant: Color(0xff6d0044),
      secondaryFixed: Color(0xff80f7df),
      onSecondaryFixed: Color(0xff001510),
      secondaryFixedDim: Color(0xff62dac3),
      onSecondaryFixedVariant: Color(0xff003e35),
      tertiaryFixed: Color(0xffe3dfff),
      onTertiaryFixed: Color(0xff09004b),
      tertiaryFixedDim: Color(0xffc4c0ff),
      onTertiaryFixedVariant: Color(0xff2812a8),
      surfaceDim: Color(0xff1c1015),
      surfaceBright: Color(0xff504046),
      surfaceContainerLowest: Color(0xff0e0509),
      surfaceContainerLow: Color(0xff271a1f),
      surfaceContainer: Color(0xff322429),
      surfaceContainerHigh: Color(0xff3d2f34),
      surfaceContainerHighest: Color(0xff49393f),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffebf1),
      surfaceTint: Color(0xffffafd1),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffffa9ce),
      onPrimaryContainer: Color(0xff200010),
      secondary: Color(0xffe0fff6),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff79f0d8),
      onSecondaryContainer: Color(0xff002b24),
      tertiary: Color(0xfff2eeff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffbfbcff),
      onTertiaryContainer: Color(0xff06003a),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff1c1015),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffffebf1),
      outlineVariant: Color(0xffd9bbc5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xfff4dce4),
      inversePrimary: Color(0xff8e005a),
      primaryFixed: Color(0xffffd8e6),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffffafd1),
      onPrimaryFixedVariant: Color(0xff2a0018),
      secondaryFixed: Color(0xff80f7df),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff62dac3),
      onSecondaryFixedVariant: Color(0xff001510),
      tertiaryFixed: Color(0xffe3dfff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc4c0ff),
      onTertiaryFixedVariant: Color(0xff09004b),
      surfaceDim: Color(0xff1c1015),
      surfaceBright: Color(0xff5c4c52),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff291c21),
      surfaceContainer: Color(0xff3b2c32),
      surfaceContainerHigh: Color(0xff47373d),
      surfaceContainerHighest: Color(0xff524248),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

TextTheme createTextTheme(
  BuildContext context,
  String bodyFontString,
  String displayFontString,
) {
  final TextTheme baseTextTheme = Theme.of(context).textTheme;
  final TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
    bodyFontString,
    baseTextTheme,
  );
  final TextTheme displayTextTheme = GoogleFonts.getTextTheme(
    displayFontString,
    baseTextTheme,
  );
  final TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
