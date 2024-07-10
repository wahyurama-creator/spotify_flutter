import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_flutter/presentation/screens/choose_mode/bloc/theme_cubit.dart';

class AppMultiProvider {
  static List<BlocProvider> providers = [
    ..._themeProvider,
  ];

  static final List<BlocProvider> _themeProvider = [
    BlocProvider(create: (_) => ThemeCubit())
  ];
}