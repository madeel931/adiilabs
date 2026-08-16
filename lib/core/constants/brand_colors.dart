import 'package:flutter/material.dart';

/// Official ADii Labs Brand Colors (V2 Palette)
abstract class BrandColors {
  // Dark Palette (Primary)
  static const Color background = Color(0xFF080B10);
  static const Color surface = Color(0xFF10151D);
  static const Color surfaceElevated = Color(0xFF151B24);
  static const Color border = Color(0xFF202833);

  // Brand Accents
  static const Color primary = Color(0xFF4D8DFF);
  static const Color primaryHover = Color(0xFF6A9EFF);
  static const Color primarySoft = Color(0xFF7AA7FF);

  // Text
  static const Color textMain = Color(0xFFF5F7FA);
  static const Color textSecondary = Color(0xFF9AA4B2);
  static const Color textMuted = Color(0xFF667181);

  // Light Palette (For light mode support)
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceElevatedLight = Color(0xFFF5F5F5);
  static const Color borderLight = Color(0xFFE5E7EB);
  static const Color textMainLight = Color(0xFF111827);
  static const Color textSecondaryLight = Color(0xFF4B5563);
  static const Color textMutedLight = Color(0xFF9CA3AF);
}
