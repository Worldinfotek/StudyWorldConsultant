import 'package:OWILC/core/routes/spp_routes.dart';
import 'package:OWILC/features/splash/animation/floating_particles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/colors/app_colors.dart';
import '../../../core/constant/app_constant.dart';
import '../bloc/onboarding_bloc.dart';
import '../card/onboarding_card.dart';
import '../model/onboarding_model.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingBloc(),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView();

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNext(BuildContext context, int currentPage) {
    if (currentPage < onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Wind-like floating particles across the whole onboarding screen.
          const Positioned.fill(
            child: FloatingParticles(
              particleCount: 35,
              particleColor: AppColors.primaryMaroon,
            ),
          ),
          SafeArea(
            child: BlocBuilder<OnboardingBloc, OnboardingState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.all(4.w),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(AppRoutes.onBoarding);
                          },
                          child: Text(
                            AppConstant.onboardingSkipText,
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: onboardingPages.length,
                        onPageChanged: (index) {
                          context.read<OnboardingBloc>().add(
                            OnboardingPageChanged(index),
                          );
                        },
                        itemBuilder: (context, index) {
                          return OnboardingCard(data: onboardingPages[index]);
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardingPages.length,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          width: state.currentPage == index ? 6.w : 2.w,
                          height: 1.h,
                          decoration: BoxDecoration(
                            color: state.currentPage == index
                                ? AppColors.primaryMaroon
                                : AppColors.primaryMaroon.withOpacity(0.25),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryMaroon,
                            padding: EdgeInsets.symmetric(vertical: 1.8.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () =>
                              _goToNext(context, state.currentPage),
                          child: Text(
                            state.currentPage == onboardingPages.length - 1
                                ? AppConstant.onboardingGetStartedText
                                : AppConstant.onboardingNextText,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
