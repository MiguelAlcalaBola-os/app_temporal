// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class MyTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  static const Color primary = Color(0xFF2B78DC);
  static const Color secondary = Color(0xFF5A9BEE);
  static const Color tertiary = Color(0xFFFFFFFF);
  static const Color alternate = Color(0xFF2B78DC);
  static const Color primaryText = Color(0xFF090F13);
  static const Color secondaryText = Color(0xFF757575);
  static const Color primaryBackground = Color(0xFFF1F4F8);
  static const Color secondaryBackground = Color(0xFFFFFFFF);
  static const Color accent1 = Color(0xFF616161);
  static const Color accent2 = Color(0xFF757575);
  static const Color accent3 = Color(0xFFE0E0E0);
  static const Color accent4 = Color(0xFFEEEEEE);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFF44336);
  static const Color info = Color(0xFF2196F3);
  static const Color lineColor = Color(0xFFDBE2E7);
  static const Color loginLogo = Color(0xFFFFFFFF);
  static const Color titleLogo = Color(0xFF000088);
  static const Color bottomBarLoginText = Color(0xFFFFFFFF);
  static const Color errorGeneral = Color(0xFFF77066);
  static const Color successGeneral = Color(0xFF46EF98);
  static const Color reservaPendiente = Color(0xFFFFA500);
  static const Color usuario = Color(0xFF2B78DC);
  static const Color aguamarina = Color.fromARGB(255, 176, 241, 234);
  static const Color proveedor = Color(0xFF46EF98);
  static const Color tarifas = Color(0xFF4D39D20);

  static String get displayLargeFamily => 'Outfit';
  static TextStyle get displayLarge => GoogleFonts.getFont(
        'Outfit',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  static String get displayMediumFamily => 'Outfit';
  static TextStyle get displayMedium => GoogleFonts.getFont(
        'Outfit',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  static String get displaySmallFamily => 'Outfit';
  static TextStyle get displaySmall => GoogleFonts.getFont(
        'Outfit',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  static String get headlineLargeFamily => 'Outfit';
  static TextStyle get headlineLarge => GoogleFonts.getFont(
        'Outfit',
        color: primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  static String get headlineMediumFamily => 'Outfit';
  static TextStyle get headlineMedium => GoogleFonts.getFont(
        'Outfit',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  static String get headlineSmallFamily => 'Outfit';
  static TextStyle get headlineSmall => GoogleFonts.getFont(
        'Outfit',
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  static String get titleLargeFamily => 'Outfit';
  static TextStyle get titleLarge => GoogleFonts.getFont(
        'Outfit',
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  static String get titleMediumFamily => 'Readex Pro';
  static TextStyle get titleMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  static String get titleSmallFamily => 'Readex Pro';
  static TextStyle get titleSmall => GoogleFonts.getFont(
        'Readex Pro',
        color: info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  static String get labelLargeFamily => 'Readex Pro';
  static TextStyle get labelLarge => GoogleFonts.getFont(
        'Readex Pro',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  static String get labelMediumFamily => 'Readex Pro';
  static TextStyle get labelMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  static String get labelSmallFamily => 'Readex Pro';
  static TextStyle get labelSmall => GoogleFonts.getFont(
        'Readex Pro',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  static String get bodyLargeFamily => 'Readex Pro';
  static TextStyle get bodyLarge => GoogleFonts.getFont(
        'Readex Pro',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  static String get bodyMediumFamily => 'Readex Pro';
  static TextStyle get bodyMedium => GoogleFonts.getFont(
        'Readex Pro',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  static String get bodySmallFamily => 'Readex Pro';
  static TextStyle get bodySmall => GoogleFonts.getFont(
        'Readex Pro',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}
