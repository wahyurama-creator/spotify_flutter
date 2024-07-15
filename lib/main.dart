import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spotify_flutter/core/configs/themes/app_theme.dart';
import 'package:spotify_flutter/dependency_injection.dart';
import 'package:spotify_flutter/firebase_options.dart';
import 'package:spotify_flutter/presentation/screens/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify_flutter/presentation/screens/splash/page/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initHydratedBloc();
  await initDependencyInjection();
  await _initFirebase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeState) {
          return ScreenUtilInit(
            minTextAdapt: true,
            designSize: const Size(390, 844),
            builder: (context, child) {
              return MaterialApp(
                debugShowCheckedModeBanner: kDebugMode ? true : false,
                title: 'Spotify Flutter',
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: themeState,
                home: child,
              );
            },
            child: const SplashPage(),
          );
        },
      ),
    );
  }
}

Future<void> _initHydratedBloc() async {
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
}

Future<void> _initFirebase() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}