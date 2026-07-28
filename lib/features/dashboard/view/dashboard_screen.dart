import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/colors/app_colors.dart';
import '../block/dashboard_bloc.dart';
import '../card/dashboard_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc()..add(DashboardStarted()),
      child: Scaffold(
        backgroundColor: AppColors.onboardingBackground,
        body: SafeArea(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.bottomNavBackground,
                  ),
                );
              }

              final cards = (state as DashboardLoaded).cards;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                child: AnimationLimiter(
                  child: GridView.builder(
                    itemCount: cards.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3.w,
                      mainAxisSpacing: 3.w,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        duration: const Duration(milliseconds: 900),
                        columnCount: 3,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: DashboardCard(data: cards[index]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
              ;
            },
          ),
        ),
      ),
    );
  }
}
