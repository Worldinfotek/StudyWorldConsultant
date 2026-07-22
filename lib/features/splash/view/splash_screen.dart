import 'package:OWILC/core/constant/app_constant.dart';
import 'package:OWILC/core/routes/spp_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


import '../../../core/colors/app_colors.dart';
import '../animation/floating_particles.dart';
import '../bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(SplashStarted()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashCompleted) {
            Navigator.of(context).pushReplacementNamed(AppRoutes.onBoarding);
          }
        },
        child: const _SplashView(),
      ),
    );
  }
}

class _SplashView extends StatefulWidget {
  const _SplashView();

  @override
  State<_SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<_SplashView>
    with TickerProviderStateMixin {
  late final AnimationController _logoController;
  late final AnimationController _textController;

  late final Animation<double> _logoFade;
  late final Animation<double> _logoScale;
  late final Animation<double> _textFade;
  late final Animation<Offset> _textSlide;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _textController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _logoFade = CurvedAnimation(parent: _logoController, curve: Curves.easeOut);
    _logoScale = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeOutBack),
    );

    _textFade = CurvedAnimation(parent: _textController, curve: Curves.easeOut);
    _textSlide = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(
          CurvedAnimation(parent: _textController, curve: Curves.easeOutCubic),
        );

    // Logo appears first, then text follows with a short delay — elegant staggered entrance.
    _logoController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _textController.forward();
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///===========================================
      ///Body
      ///===========================================
      body: Container(
        decoration: const BoxDecoration(
          // Brownish gradient background — matches the logo tone.
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.background, AppColors.backgroundLight],
          ),
        ),
        child: Stack(
          children: [

            ///==========================================================
            ///Wind-like floating particles across the whole screen.
            ///==========================================================
            const Positioned.fill(
              child: FloatingParticles(
                particleCount: 35,
                particleColor: AppColors.particle,
              ),
            ),


            ///========================================================
            /// Center: logo + elegant animated text.
            ///========================================================
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeTransition(
                    opacity: _logoFade,
                    child: ScaleTransition(
                      scale: _logoScale,
                      child: const _DummyLogo(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  FadeTransition(
                    opacity: _textFade,
                    child: SlideTransition(
                      position: _textSlide,
                      child: Text(
                        textAlign: TextAlign.center,
                        AppConstant.splashText,
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 4,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///=========================================================
///Splash Logo
///=========================================================
class _DummyLogo extends StatelessWidget {
  const _DummyLogo();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/splash_logo/logo.png',
      width: 50.w,
      height: 20.h,
      fit: BoxFit.contain,
    );
  }
}


///======================================================
///Temporary Place Holder
///======================================================
// class _NextScreenPlaceholder extends StatelessWidget {
//   const _NextScreenPlaceholder();
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(body: Center(child: Text('Next Screen (Home)')));
//   }
// }
