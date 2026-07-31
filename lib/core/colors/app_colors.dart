import 'package:flutter/material.dart';

/// Centralized color palette for the app.
/// Theme: white background + maroon-red accent (matches brand reference).
class AppColors {
  AppColors._(); // prevents instantiation

  // ==========================================================
  // BASE PALETTE — shared building blocks, don't use directly
  // in screens; use the section-specific names below instead.
  // ==========================================================
  static const Color _background = Color(0xFFFFFFFF); // white
  static const Color _maroon = Color(0xFF7A2530); // brand maroon-red
  static const Color _maroonLight = Color(
    0xFF9A3B47,
  ); // lighter maroon, for highlights
  static const Color _textDark = Color(0xFF1A1A1A); // near-black text
  static const Color _textGrey = Color(0xFF6B6B6B); // muted grey text
  static const Color _onAccent = Color(
    0xFFFFFFFF,
  ); // white text/icons on maroon bg

  // ==========================================================
  // SPLASH SCREEN
  // ==========================================================
  static const Color splashBackground = _background;
  static const Color splashParticle = _maroon;
  static const Color splashText = _textDark;
  static const Color splashLogoFill = Color(0x147A2530);
  static const Color splashLogoBorder = Color(0x667A2530);
  static const Color splashLogoIcon = _maroon;

  // ==========================================================
  // LOGIN SCREEN
  // ==========================================================
  static const Color loginBackground = _background;
  static const Color loginFieldFill = Color(0xFFF5F5F5);
  static const Color loginFieldIcon = _maroon;
  static const Color loginLabelText = _textDark;
  static const Color loginHintText = _textGrey;
  static const Color loginButton = _maroon;
  static const Color loginButtonText = _onAccent;
  static const Color loginLinkText = _maroon;

  // ==========================================================
  // BOTTOM NAVIGATION BAR
  // ==========================================================
  static const Color bottomNavBackground = _maroon;
  static const Color bottomNavBackgroundLight = _maroonLight;
  static const Color bottomNavIcon = _onAccent;

  // ==========================================================
  // ONBOARDING SCREEN
  // ==========================================================
  static const Color onboardingBackground = _background;
  static const Color onboardingParticle = _maroon;
  static const Color onboardingTitle = _textDark;
  static const Color onboardingDescription = _textGrey;
  static const Color onboardingDotActive = _maroon;
  static const Color onboardingDotInactive = Color(0x407A2530);
  static const Color onboardingButton = _maroon;
  static const Color onboardingButtonText = _onAccent;
  static const Color onboardingSkipText = _textGrey;

  // ==========================================================
  // POPUPS — kept semantic (success/warning/error), independent
  // of brand theme since these colors are universally recognized.
  // ==========================================================
  static const Color popupBackground = Color(0xFFFFFFFF);
  static const Color popupTitleText = _textDark;
  static const Color popupMessageText = _textGrey;
  static const Color popupShadow = Color(0x26000000);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFF9A825);
  static const Color error = Color(0xFFC62828);

  // ==========================================================
  // Leads Management
  // ==========================================================
  static const Color leadDialogBackground = _background;
}
