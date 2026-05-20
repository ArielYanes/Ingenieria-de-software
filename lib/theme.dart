import 'package:flutter/material.dart';

class AppColors {
  // Fondos
  static const Color background = Color(0xFF0A0C10); // Fondo general super oscuro
  static const Color surface = Color(0xFF13151A); // Tarjetas y paneles
  static const Color surfaceLight = Color(0xFF1C1F26); // Campos de texto

  // Acentos
  static const Color accent = Color(0xFF00FA9A); // Verde brillante / Medium Spring Green
  static const Color accentDark = Color(0xFF008A5E);
  static const Color warning = Color(0xFFFFB300); // Para alertas (ej. clase en 5 min)

  // Textos
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Colors.white70;
  static const Color textTertiary = Colors.white54;
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.accent,
        surface: AppColors.surface,
        background: AppColors.background,
      ),
      fontFamily: 'Inter', // O Roboto si no está instalada
      useMaterial3: true,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.accent, width: 1),
        ),
        labelStyle: const TextStyle(color: AppColors.textTertiary, fontSize: 12),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.black87, // Texto oscuro en botón verde
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          elevation: 0,
        ),
      ),
    );
  }
}
