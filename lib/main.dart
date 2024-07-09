import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotify_flutter/core/configs/themes/app_theme.dart';
import 'package:spotify_flutter/presentation/pages/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: kDebugMode ? true : false,
        title: 'Spotify Flutter',
        theme: AppTheme.lightTheme,
        home: child,
      ),
      child: const SplashPage(),
    );
  }
}