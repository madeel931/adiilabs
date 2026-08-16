import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/brand_colors.dart';

class AppTheme {
  static ThemeData darkTheme() {
    final baseTextTheme = GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: BrandColors.background,
      colorScheme: const ColorScheme.dark(
        primary: BrandColors.primary,
        secondary: BrandColors.primarySoft,
        surface: BrandColors.surface,
        surfaceContainerHigh: BrandColors.surface,
        onSurface: BrandColors.textMain,
        onSurfaceVariant: BrandColors.textSecondary,
        outline: BrandColors.border,
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 72,
          fontWeight: FontWeight.w800,
          color: BrandColors.textMain,
          height: 1.1,
          letterSpacing: -2.0,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 56,
          fontWeight: FontWeight.w800,
          color: BrandColors.textMain,
          height: 1.15,
          letterSpacing: -1.5,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: BrandColors.textMain,
          height: 1.2,
          letterSpacing: -1.0,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: BrandColors.textMain,
          height: 1.3,
          letterSpacing: -0.5,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: BrandColors.textMain,
          height: 1.35,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: BrandColors.textMain,
          height: 1.4,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: BrandColors.textSecondary,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: BrandColors.textSecondary,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: BrandColors.textMain,
          letterSpacing: 0.2,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: BrandColors.border,
        thickness: 1,
      ),
      cardTheme: CardThemeData(
        color: BrandColors.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: BrandColors.border, width: 1),
        ),
      ),
    );
  }

  static ThemeData lightTheme() {
    final baseTextTheme = GoogleFonts.interTextTheme(
      ThemeData.light().textTheme,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: BrandColors.backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: BrandColors.primary,
        secondary: BrandColors.primarySoft,
        surface: BrandColors.surfaceLight,
        surfaceContainerHigh: BrandColors.surfaceLight,
        onSurface: BrandColors.textMainLight,
        onSurfaceVariant: BrandColors.textSecondaryLight,
        outline: BrandColors.borderLight,
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 72,
          fontWeight: FontWeight.w800,
          color: BrandColors.textMainLight,
          height: 1.1,
          letterSpacing: -2.0,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 56,
          fontWeight: FontWeight.w800,
          color: BrandColors.textMainLight,
          height: 1.15,
          letterSpacing: -1.5,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w700,
          color: BrandColors.textMainLight,
          height: 1.2,
          letterSpacing: -1.0,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: BrandColors.textMainLight,
          height: 1.3,
          letterSpacing: -0.5,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: BrandColors.textMainLight,
          height: 1.35,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: BrandColors.textMainLight,
          height: 1.4,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: BrandColors.textSecondaryLight,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: BrandColors.textSecondaryLight,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: BrandColors.textMainLight,
          letterSpacing: 0.2,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: BrandColors.borderLight,
        thickness: 1,
      ),
      cardTheme: CardThemeData(
        color: BrandColors.surfaceLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: BrandColors.borderLight, width: 1),
        ),
      ),
    );
  }
}
