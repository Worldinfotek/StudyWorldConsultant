import 'package:OWILC/features/authentication/view/login_screen.dart';
import 'package:OWILC/features/onboarding/view/onboarding_screen.dart';
import 'package:OWILC/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';


/// app routes
class AppRoutes {


  ///=====================================================
  ///static routes
  ///=====================================================
  static const String splash = '/';
  static const String onBoarding = '/onboarding';
  static const String login = '/login';



  ///====================================================
  ///routes widget list
  ///====================================================
  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const SplashScreen(),
    onBoarding: (context) => const OnboardingScreen(),
    login: (context) => const LoginScreen(),
  };
}
