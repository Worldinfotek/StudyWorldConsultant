import 'package:shared_preferences/shared_preferences.dart';

class OnboardingStorageService {
  OnboardingStorageService._();

  static const String _onboardingSeenKey = "onboarding_seen";

  static Future<void> markOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingSeenKey, true);
  }

  static Future<bool> hasSeenOnboading() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(_onboardingSeenKey) ?? false;
  }
}
