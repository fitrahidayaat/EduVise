import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  static TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 48,
    ),
    displayMedium: GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 36,
    ),
    displaySmall: GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
    ),
    titleLarge: GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
    titleMedium: GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
    titleSmall: GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 14,
    ),
    bodySmall: GoogleFonts.poppins(
      color: Colors.black,
      fontSize: 12,
    ),
  );
  static TextTheme darkTextTheme = TextTheme(
    displayMedium: GoogleFonts.montserrat(
      color: Colors.white70,
    ),
    titleSmall: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 24,
    ),
  );
}
