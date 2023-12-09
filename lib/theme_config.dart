import 'package:flutter/material.dart';

class ThemeConfig {
  // Colors
  static const Color primaryColor = Colors.black;
  static const Color secondaryColor = Colors.orange;
  static const Color accentColor = Colors.amber;
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Colors.black;

  // Typography
  static const TextStyle poppinsHeading1 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    fontSize: 48.0,
    color: textColor,
  );
  static const TextStyle poppinsHeading2 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 32.0,
    color: textColor,
  );
  static const TextStyle poppinsSubheading1 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 26.0,
    color: textColor,
  );
  static const TextStyle poppinsButton = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 22.0,
    color: Colors.white,
  );
  static const TextStyle poppinsParagraph = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 20.0,
    color: textColor,
  );

  static const TextStyle squirkHeading1 = TextStyle(
    fontFamily: 'Squirk',
    fontSize: 48.0,
    color: textColor,
  );
  static const TextStyle squirkHeading2 = TextStyle(
    fontFamily: 'Squirk',
    fontSize: 32.0,
    color: textColor,
  );
  static const TextStyle squirkSubheading1 = TextStyle(
    fontFamily: 'Squirk',
    fontSize: 26.0,
    color: textColor,
  );
  static const TextStyle squirkButton = TextStyle(
    fontFamily: 'Squirk',
    fontSize: 20.0,
    color: Colors.white,
  );
  static const TextStyle squirkParagraph = TextStyle(
    fontFamily: 'Squirk',
    fontSize: 16.0,
    color: textColor,
  );

  // Buttons
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    textStyle: squirkButton,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      // foregroundColor: Colors.white,
    ),
    textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: ThemeConfig.poppinsHeading2,
          // titleMedium: ThemeConfig.squirkHeading2,
          headlineLarge: ThemeConfig.squirkHeading1,
          headlineMedium: ThemeConfig.squirkHeading2,
          labelLarge: ThemeConfig.poppinsButton,
          bodyLarge: ThemeConfig.poppinsParagraph,
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        backgroundColor: primaryColor,
        textStyle: squirkButton,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    ),
  );
}
