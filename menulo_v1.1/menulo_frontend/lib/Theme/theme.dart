import 'package:flutter/material.dart';

// 1. Renkleri merkezi bir sınıfta topluyoruz.
class AppColors {
  static const Color brandColor = Color(0xFFFFA63B);
  static const Color surfaceColor = Colors.white;
  static const Color textDark = Color(0xFF2D3142);
  static const Color textMuted = Colors.grey;
}

final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.brandColor,
    primary: AppColors.brandColor,
    surface: AppColors.surfaceColor,
  ),
  fontFamily: 'Gabarito',
  scaffoldBackgroundColor: AppColors.surfaceColor,

  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.surfaceColor,
    foregroundColor: AppColors.textDark,
    elevation: 0,
    centerTitle: true,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.brandColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColors.brandColor,
      side: const BorderSide(color: AppColors.brandColor, width: 2),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 0,
    ),
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: AppColors.surfaceColor,
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const TextStyle(
          color: AppColors.brandColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        );
      }
      return const TextStyle(
        color: AppColors.textMuted,
        fontSize: 12,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(
          color: AppColors.brandColor,
          size: 28,
        );
      }
      return const IconThemeData(
        color: AppColors.textMuted,
        size: 24,
      );
    }),
    indicatorColor: Colors.transparent,
  ),

  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.surfaceColor,
    foregroundColor: AppColors.brandColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: AppColors.brandColor, width: 2),
    ),
  ),
);