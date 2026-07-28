import 'package:OWILC/features/home/view/home_screen.dart';
import 'package:OWILC/navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/colors/app_colors.dart';
import '../model/menu_item_model.dart';
import '../widget/custom_botton_nav_bar.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  static const List<MenuItem> _screens = [
    MenuItem(
      label: 'My Menu',
      icon: Icons.home_outlined,
      screen: HomeScreen(),
      lottiePath: 'assets/bottom_nav/home.lottie',
    ),
    MenuItem(
      label: 'Reports',
      icon: Icons.description_outlined,
      screen: _PlaceholderScreen(label: 'Reports'),
      lottiePath: 'assets/bottom_nav/report.lottie',
    ),
    MenuItem(
      label: 'Accounts',
      icon: Icons.account_balance_outlined,
      screen: _PlaceholderScreen(label: 'Accounts'),
      lottiePath: 'assets/bottom_nav/account.lottie',
    ),
    MenuItem(
      label: 'Settings',
      icon: Icons.settings_suggest,
      screen: _PlaceholderScreen(label: 'Settings'),
      lottiePath: 'assets/bottom_nav/setting.lottie',
    ),
    MenuItem(
      label: 'Administrator',
      icon: Icons.settings_applications,
      screen: _PlaceholderScreen(label: 'Administrator'),
      lottiePath: 'assets/bottom_nav/admin.lottie',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavigationBloc(),
      child: Scaffold(
        backgroundColor: AppColors.onboardingBackground,
        extendBody: true,
        body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
          builder: (context, state) {
            return _screens[state.currentIndex].screen;
          },
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                return CustomBottomNavBar(
                  currentIndex: state.currentIndex,
                  barHeight: 65,
                  circleSize: 62,
                  circleGap: 10,
                  barColor: AppColors.bottomNavBackground.withOpacity(0.8),
                  items: _screens,
                  onTap: (index) {
                    context.read<BottomNavigationBloc>().add(
                      NavigationTabChanged(index),
                    );
                  },
                );
              },
            ),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  final String label;

  const _PlaceholderScreen({required this.label});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.onboardingTitle,
        ),
      ),
    );
  }
}
