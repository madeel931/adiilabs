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
      scaffoldBackgroundColor: BrandColors.deepNavy,
      colorScheme: const ColorScheme.dark(
        primary: BrandColors.electricBlue,
        secondary: BrandColors.indigo,
        surface: BrandColors.surfaceDark,
        surfaceContainerHigh: BrandColors.cardDark,
        onSurface: BrandColors.textDarkPrimary,
        onSurfaceVariant: BrandColors.textDarkSecondary,
        outline: BrandColors.borderDark,
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: BrandColors.textDarkPrimary,
          height: 1.15,
          letterSpacing: -1.0,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: BrandColors.textDarkPrimary,
          height: 1.2,
          letterSpacing: -0.75,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: BrandColors.textDarkPrimary,
          height: 1.25,
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: BrandColors.textDarkPrimary,
          height: 1.3,
          letterSpacing: -0.3,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: BrandColors.textDarkPrimary,
          height: 1.35,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: BrandColors.textDarkPrimary,
          height: 1.4,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: BrandColors.textDarkSecondary,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: BrandColors.textDarkSecondary,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: BrandColors.white,
          letterSpacing: 0.2,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: BrandColors.borderDark,
        thickness: 1,
      ),
      cardTheme: CardThemeData(
        color: BrandColors.cardDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: BrandColors.borderDark, width: 1),
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
      scaffoldBackgroundColor: BrandColors.surfaceLight,
      colorScheme: const ColorScheme.light(
        primary: BrandColors.electricBlue,
        secondary: BrandColors.indigo,
        surface: BrandColors.surfaceLight,
        surfaceContainerHigh: BrandColors.cardLight,
        onSurface: BrandColors.textLightPrimary,
        onSurfaceVariant: BrandColors.textLightSecondary,
        outline: BrandColors.borderLight,
      ),
      textTheme: baseTextTheme.copyWith(
        displayLarge: GoogleFonts.inter(
          fontSize: 48,
          fontWeight: FontWeight.w800,
          color: BrandColors.textLightPrimary,
          height: 1.15,
          letterSpacing: -1.0,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 36,
          fontWeight: FontWeight.w800,
          color: BrandColors.textLightPrimary,
          height: 1.2,
          letterSpacing: -0.75,
        ),
        headlineLarge: GoogleFonts.inter(
          fontSize: 30,
          fontWeight: FontWeight.w700,
          color: BrandColors.textLightPrimary,
          height: 1.25,
          letterSpacing: -0.5,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: BrandColors.textLightPrimary,
          height: 1.3,
          letterSpacing: -0.3,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: BrandColors.textLightPrimary,
          height: 1.35,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: BrandColors.textLightPrimary,
          height: 1.4,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: BrandColors.textLightSecondary,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: BrandColors.textLightSecondary,
          height: 1.6,
        ),
        labelLarge: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: BrandColors.white,
          letterSpacing: 0.2,
        ),
      ),
      dividerTheme: const DividerThemeData(
        color: BrandColors.borderLight,
        thickness: 1,
      ),
      cardTheme: CardThemeData(
        color: BrandColors.cardLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: BrandColors.borderLight, width: 1),
        ),
      ),
    );
  }
}
