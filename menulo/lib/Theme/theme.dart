import 'package:flutter/material.dart';

final Color brandColor = const Color(0xFFFFA63B);

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: brandColor,
    primary: brandColor,
    surface: Colors.white,
  ),
  fontFamily: 'Gabarito',
  scaffoldBackgroundColor: Colors.white,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Color(0xFF2D3142),
    elevation: 0,
    centerTitle: true,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: brandColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: brandColor,
      side: BorderSide(color: brandColor, width: 2),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
    ),
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.white,

    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return TextStyle(
          color: brandColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        );
      }
      return const TextStyle(color: Colors.grey, fontSize: 12);
    }),

    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return  IconThemeData(color: brandColor, size: 28);
      }
      return const IconThemeData(color: Colors.grey, size: 24);
    }),
    indicatorColor: Colors.transparent,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.white,
    foregroundColor: brandColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side:  BorderSide(color: brandColor, width: 2),
    ),
  ),
);
