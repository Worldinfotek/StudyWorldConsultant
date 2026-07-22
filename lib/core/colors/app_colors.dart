import 'package:flutter/material.dart';

/// Centralized color palette for the app.
/// Matched to the dark navy + orange "Credentials & Affiliations" reference theme.
class AppColors {
  AppColors._(); // prevents instantiation

  // Dark navy background theme
  static const Color background = Color(0xFF0B0E17); // deep navy/black
  static const Color backgroundLight = Color(0xFF141826); // slightly lighter navy, for gradients

  // Orange accents (matches buttons, highlights)
  static const Color primaryMaroon = Color(0xFFE8720C); // brand orange — main accent
  static const Color accentMaroon = Color(0xFFF2994A); // lighter orange, for highlights

  // Text
  static const Color textPrimary = Color(0xFFFFFFFF); // white — matches headings on dark bg
  static const Color textSecondary = Color(0xFFB8BCC8); // muted grey, for secondary text

  // Particles / decorative
  static const Color particle = Color(0xFFE8720C); // orange floating dots

  // Logo placeholder
  static const Color logoPlaceholderFill = Color(0x1AE8720C); // subtle orange overlay
  static const Color logoPlaceholderBorder = Color(0x66E8720C); // orange border
  static const Color logoPlaceholderIcon = Color(0xFFE8720C); // orange icon
}



