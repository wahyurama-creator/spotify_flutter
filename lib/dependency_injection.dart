import 'package:get_it/get_it.dart';
import 'package:spotify_flutter/data/repositories/auth_repository_impl.dart';
import 'package:spotify_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter/data/sources/auth/auth_firebase_service_impl.dart';
import 'package:spotify_flutter/domain/repositories/auth/auth_repository.dart';
import 'package:spotify_flutter/domain/usecases/auth/sign_up_usecase.dart';

final getIt = GetIt.instance;

Future<void> initDependencyInjection() async {
  await _initService();
  await _initRepository();
  _initUseCase();
}

Future<void> _initService() async {
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
}

Future<void> _initRepository() async {
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
}

Future<void> _initUseCase() async {
  getIt.registerSingleton<SignUpUsecase>(SignUpUsecase());
}