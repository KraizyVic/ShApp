import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        secondary: Colors.grey.shade300,
        tertiary: Colors.grey.shade400,
    ),
);
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
     secondary: Colors.grey.shade700,
     tertiary: Colors.white24,
    )
);
