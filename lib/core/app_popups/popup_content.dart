import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../colors/app_colors.dart';

class PopupContent extends StatefulWidget {
  final String title;
  final String message;
  final IconData icon;
  final Color accentColor;
  final VoidCallback? onOkPressed;

  const PopupContent({
    super.key,
    required this.title,
    required this.message,
    required this.icon,
    required this.accentColor,
    this.onOkPressed,
  });

  @override
  State<PopupContent> createState() => _PopupContentState();
}

class _PopupContentState extends State<PopupContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _exitController;
  late final Animation<double> _exitScale;
  late final Animation<Offset> _exitSlide;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();

    // Randomly picks left or right for the exit slide direction.
    final slideToLeft = Random().nextBool();

    _exitController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 280),
    );

    _exitScale = Tween<double>(
      begin: 1.0,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _exitController, curve: Curves.easeIn));

    _exitSlide = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(slideToLeft ? -1.5 : 1.5, 0),
    ).animate(CurvedAnimation(parent: _exitController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _exitController.dispose();
    super.dispose();
  }

  Future<void> _handleClose() async {
    if (_isClosing) return;
    _isClosing = true;

    await _exitController.forward();

    if (mounted) {
      Navigator.of(context).pop();
      widget.onOkPressed?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) _handleClose();
      },
      child: Center(
        child: AnimatedBuilder(
          animation: _exitController,
          builder: (context, child) {
            return SlideTransition(
              position: _exitSlide,
              child: ScaleTransition(scale: _exitScale, child: child),
            );
          },
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 16.w,
                    height: 16.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: widget.accentColor.withOpacity(0.12),
                    ),
                    child: Icon(
                      widget.icon,
                      color: widget.accentColor,
                      size: 9.w,
                    ),
                  ),
                  SizedBox(height: 2.5.h),
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    widget.message,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.accentColor,
                        padding: EdgeInsets.symmetric(vertical: 1.6.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _handleClose,
                      child: Text(
                        'OK',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
