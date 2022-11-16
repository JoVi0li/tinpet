import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextTheme {
  static TextStyle? get headline1 => GoogleFonts.barlow(
        color: const Color(0xFF080506),
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
      );

  static TextStyle? get headline2 => GoogleFonts.barlow(
        color: const Color(0xFFD10A08),
        fontSize: 48.0,
        fontWeight: FontWeight.bold,
      );

  static TextStyle? get headline3 => GoogleFonts.barlow(
        color: const Color(0xFFD10A08),
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      );

  static TextStyle? get body1 => GoogleFonts.barlow(
        color: const Color(0xFFFFFFFF),
        fontSize: 35.0,
        fontWeight: FontWeight.w600,
      );

  static TextStyle? get body2 => GoogleFonts.barlow(
        color: const Color(0xFFFFFFFF),
        fontSize: 24.0,
        fontWeight: FontWeight.normal,
      );

  static TextStyle? get body3 => GoogleFonts.barlow(
        color: const Color(0xFF080506),
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      );

  static TextStyle? get body4 => GoogleFonts.barlow(
        color: const Color(0xFF080506),
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
      );

  static TextStyle? get body5 => GoogleFonts.barlow(
        color: const Color(0xFFFFFFFF),
        fontSize: 28.0,
        fontWeight: FontWeight.normal,
      );
  static TextStyle? get body6 => GoogleFonts.barlow(
        color: const Color(0xFFFFFFFF),
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      );
  static TextStyle? get body7 => GoogleFonts.barlow(
        color: const Color(0xFFFFFFFF),
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
      );

  static TextStyle? get googleSignInButton => GoogleFonts.roboto(
        color: const Color(0xFF000000).withOpacity(0.54),
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      );
}
