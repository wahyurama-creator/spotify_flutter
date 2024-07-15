import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/domain/entities/network/request/auth/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserRequest request);
  Future<void> signIn();
}