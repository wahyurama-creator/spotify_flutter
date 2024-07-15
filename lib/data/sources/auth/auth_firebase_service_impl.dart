import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify_flutter/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify_flutter/domain/entities/network/request/auth/create_user_request.dart';

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  @override
  Future<void> signIn() {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUserRequest request) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      return const Right('Success');
    } on FirebaseAuthException catch (e) {
      late String message;

      switch (e.code) {
        case 'email-already-in-use':
          message = 'Email already in use';
          break;
        case 'weak-password':
          message = 'Password is to weak & should be at least 6 characters';
          break;
        default:
          message = e.code;
      }
      return Left(message);
    }
  }
}