import 'package:flutter/material.dart';

import 'core/routes/spp_routes.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      ///debug banner remover
      debugShowCheckedModeBanner: false,

      ///initial routes
      initialRoute: AppRoutes.splash,

      ///routes
      routes: AppRoutes.routes,
    );
  }
}
