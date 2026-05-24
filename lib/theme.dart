import 'package:flutter/material.dart';

class AppColors {
  // Fondos - Nuevo Tema Claro
  static const Color background = Color(0xFFB5E2FA); // Azul Claro
  static const Color surface = Color(0xFFF9F7F3); // Crema / Blanco Roto
  static const Color surfaceLight = Color(0xFFFFFFFF); // Blanco puro para campos

  // Acentos
  static const Color accent = Color(0xFF0FA3B1); // Turquesa
  static const Color accentDark = Color(0xFF2A9D8F); // Verde Azulado
  static const Color warning = Color(0xFFFFB300); // Para alertas

  // Textos (Oscuros para contraste en fondo claro)
  static const Color textPrimary = Color(0xFF264653); // Pizarra Oscuro
  static const Color textSecondary = Color(0xB2264653); // Pizarra Oscuro 70% opacidad
  static const Color textTertiary = Color(0x7F264653); // Pizarra Oscuro 50% opacidad
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: const ColorScheme.light(
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
          foregroundColor: Colors.white, // Texto blanco en botón turquesa
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
