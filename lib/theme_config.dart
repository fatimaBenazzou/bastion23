import 'package:flutter/material.dart';

class ThemeConfig {
  // Colors
  static const Color primaryColor = Color.fromARGB(255, 4, 5, 15);
  static const Color secondaryColor = Color.fromARGB(255, 246, 133, 27);
  static const Color secondaryButton = Color.fromRGBO(22, 22, 34, 0.1);
  static const Color violet = Color.fromRGBO(64, 30, 188, 1);
  static const Color lilas = Color.fromRGBO(81, 38, 230, 1);
  static const Color bleu = Color.fromRGBO(15, 19, 54, 1);
  static const Color accentColor = Colors.amber;
  static const Color backgroundColor = Color.fromARGB(255, 240, 239, 243);
  static const Color buttonColor = Color.fromARGB(255, 240, 239, 243);
  static const Color textColor = Colors.black;
  static const Color subtextColor = Color.fromRGBO(11, 28, 63, 0.7);

  // Typography
  static const TextStyle poppinsHeading1 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    fontSize: 32.0,
    color: textColor,
  );
  static const TextStyle poppinsHeading2 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 28.0,
    color: textColor,
  );
  static const TextStyle poppinsSubheading1 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 26.0,
    color: textColor,
  );
  static const TextStyle poppinsSubheading2 = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: textColor,
  );
  static const TextStyle poppinsParagraph = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 14.0,
    color: subtextColor,
  );

  static const TextStyle squirkHeading1 = TextStyle(
    fontFamily: 'Squirk',
    fontSize: 32.0,
    color: textColor,
  );
  static const TextStyle squirkHeading2 = TextStyle(
    fontFamily: 'Squirk',
    fontSize: 26.0,
    color: textColor,
  );
  // static const TextStyle squirkSubheading1 = TextStyle(
  //   fontFamily: 'Squirk',
  //   fontSize: 20.0,
  //   color: textColor,
  // );
  static const TextStyle squirkButton = TextStyle(
    fontFamily: 'Squirk',
    fontSize: 20.0,
    color: buttonColor,
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
          titleLarge: ThemeConfig.poppinsHeading1,
          titleMedium: ThemeConfig.poppinsHeading2,
          // titleSmall: ThemeConfig.squirkHeading2,
          headlineLarge: ThemeConfig.squirkHeading1,
          headlineMedium: ThemeConfig.squirkHeading2,
          // headlineSmall: ThemeConfig.squirkHeading2,
          bodyLarge: ThemeConfig.poppinsSubheading1,
          bodyMedium: ThemeConfig.poppinsSubheading2,
          bodySmall: ThemeConfig.poppinsParagraph,
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
