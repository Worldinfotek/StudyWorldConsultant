import 'package:OWILC/navigation_bar/bloc/bottom_navigation_bloc.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/colors/app_colors.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  static const List<Widget> _screens = [
    _PlaceholderScreen(label: 'My Menu'),
    _PlaceholderScreen(label: 'Account'),
    _PlaceholderScreen(label: 'Reports'),
    _PlaceholderScreen(label: 'Administrator'),
    _PlaceholderScreen(label: 'Settings'),
  ];

  static const List<IconData> _icons = [
    Icons.home_outlined,
    Icons.miscellaneous_services_outlined,
    Icons.description_outlined,
    Icons.chat_bubble_outline,
    Icons.person_outline,
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
            return _screens[state.currentIndex];
          },
        ),
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
              builder: (context, state) {
                return CurvedNavigationBar(
                  index: state.currentIndex,
                  backgroundColor: Colors.transparent,
                  color: AppColors.bottomNavBackground,
                  buttonBackgroundColor: AppColors.bottomNavBackground,
                  animationDuration: const Duration(milliseconds: 350),
                  animationCurve: Curves.easeOutCubic,
                  items: _icons
                      .map((icon) => Icon(icon, size: 26, color: Colors.white))
                      .toList(),
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
