import 'package:flutter/material.dart';

abstract final class AppColors {
  // Brand
  static const Color primary = Color(0xFFFF6B35);
  static const Color accent = Color(0xFFD62828);

  // Backgrounds
  static const Color background = Color(0xFFFFF8F0);
  static const Color surface = Color(0xFFFFFFFF);

  // Text
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);

  // Border radius values (logical)
  static const double radiusS = 12;
  static const double radiusM = 16;
  static const double radiusL = 24;

  // Padding values
  static const double paddingS = 8;
  static const double paddingM = 16;
  static const double paddingL = 24;

  // Utility
  static const Color error = Color(0xFFD62828);
  static const Color divider = Color(0xFFEEEEEE);
  static const Color shadow = Color(0x1A000000);
}
