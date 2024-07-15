import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter/dependency_injection.dart';
import 'package:spotify_flutter/domain/entities/network/request/auth/create_user_request.dart';
import 'package:spotify_flutter/domain/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _authFirebaseService = getIt.get<AuthFirebaseService>();

  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUserRequest request) async {
    return await _authFirebaseService.signUp(request);
  }
}