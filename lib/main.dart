import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ///========================================
  ///Portrait mode lock
  ///========================================
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return const MyApp();
      },
    ),
  );
}
