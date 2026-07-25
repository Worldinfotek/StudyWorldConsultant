import 'package:OWILC/core/app_popups/app_popups.dart';
import 'package:OWILC/core/routes/spp_routes.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/app_constant.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.loginBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 6.h),

              Center(
                child: Image.asset(
                  'assets/splash_logo/logo.jpeg',
                  width: 50.w,
                  height: 20.h,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: 6.h),

              Text(
                AppConstant.loginTitle,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.loginLabelText,
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                AppConstant.loginSubtitle,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.loginHintText,
                ),
              ),

              SizedBox(height: 5.h),

              // Username field
              Text(
                AppConstant.usernameLabel,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.loginLabelText,
                ),
              ),
              SizedBox(height: 1.h),
              TextField(
                controller: _usernameController,
                style: TextStyle(fontSize: 15.sp, color: AppColors.loginLabelText),
                decoration: InputDecoration(
                  hintText: AppConstant.usernameHint,
                  hintStyle: TextStyle(
                    fontSize: 13.sp,
                    color: AppColors.loginHintText,
                  ),
                  prefixIcon: Icon(
                    Icons.person_outline,
                    color: AppColors.loginFieldIcon,
                  ),
                  filled: true,
                  fillColor: AppColors.loginFieldFill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 1.8.h,
                  ),
                ),
              ),

              SizedBox(height: 2.5.h),

              // Password field
              Text(
                AppConstant.passwordLabel,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.loginLabelText,
                ),
              ),
              SizedBox(height: 1.h),
              TextField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                style: TextStyle(fontSize: 14.sp, color: AppColors.loginLabelText),
                decoration: InputDecoration(
                  hintText: AppConstant.passwordHint,
                  hintStyle: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.loginHintText,
                  ),
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: AppColors.loginFieldIcon,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: AppColors.loginHintText,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                  filled: true,
                  fillColor: AppColors.loginFieldFill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 1.8.h,
                  ),
                ),
              ),

              SizedBox(height: 5.h),

              // Login button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.loginButton,
                    padding: EdgeInsets.symmetric(vertical: 1.8.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    AppPopups.success(
                      context,
                      message: "In Development",
                      onOkPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          AppRoutes.bottomNavigationScreen,
                        );
                      },
                    );
                  },
                  child: Text(
                    AppConstant.loginButtonText,
                    style: TextStyle(
                      color: AppColors.loginButtonText,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}