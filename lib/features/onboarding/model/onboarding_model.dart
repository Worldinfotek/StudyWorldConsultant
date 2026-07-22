import 'package:OWILC/core/constant/app_constant.dart';

class OnboardingModel {
  ///==================================
  /// final variables
  ///==================================
  final String title;
  final String description;
  final String imagePath;

  ///==================================
  /// constructor
  ///==================================
  OnboardingModel({
    required this.title,
    required this.description,
    required this.imagePath,
  });
}

///=================================
/// onboarding data/List
///=================================
final List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    title: AppConstant.page1Title,
    description: AppConstant.page1Description,
    imagePath: "assets/onboarding_logo/logo1.png",
  ),
  OnboardingModel(
    title: AppConstant.page2Title,
    description: AppConstant.page2Description,
    imagePath: "assets/onboarding_logo/logo2.png"
  ),
  OnboardingModel(
    title: AppConstant.page3Title,
    description: AppConstant.page3Description,
    imagePath: "assets/onboarding_logo/logo3.png",
  ),
];
