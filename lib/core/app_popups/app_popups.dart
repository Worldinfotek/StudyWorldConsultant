import 'package:flutter/material.dart';

import 'popup_content.dart';

class AppPopups {
  AppPopups._();

  static void success(
    BuildContext context, {
    required String message,
    String? title,
    VoidCallback? onOkPressed,
  }) {
    _showPopup(
      context,
      title: title ?? 'Success',
      message: message,
      lottiePath: 'assets/popups/success.lottie',
      accentColor: const Color(0xFF2E7D32),
      onOkPressed: onOkPressed,
    );
  }

  static void warning(
    BuildContext context, {
    required String message,
    String? title,
    VoidCallback? onOkPressed,
  }) {
    _showPopup(
      context,
      title: title ?? 'Warning',
      message: message,
      lottiePath: 'assets/popups/warning.lottie',
      accentColor: const Color(0xFFF9A825),
      onOkPressed: onOkPressed,
    );
  }

  static void error(
    BuildContext context, {
    required String message,
    String? title,
    VoidCallback? onOkPressed,
  }) {
    _showPopup(
      context,
      title: title ?? 'Error',
      message: message,
      lottiePath: 'assets/popups/error.lottie',
      accentColor: const Color(0xFFC62828),
      onOkPressed: onOkPressed,
    );
  }

  static void _showPopup(
    BuildContext context, {
    required String title,
    required String message,
    required String lottiePath,
    required Color accentColor,
    VoidCallback? onOkPressed,
  }) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: title,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) {
        return const SizedBox.shrink();
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );
        return ScaleTransition(
          scale: curved,
          child: FadeTransition(
            opacity: animation,
            child: PopupContent(
              title: title,
              message: message,
              lottiePath: lottiePath,
              accentColor: accentColor,
              onOkPressed: onOkPressed,
            ),
          ),
        );
      },
    );
  }
}
