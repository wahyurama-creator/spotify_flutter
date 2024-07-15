import 'package:dartz/dartz.dart';
import 'package:spotify_flutter/dependency_injection.dart';
import 'package:spotify_flutter/domain/entities/network/request/auth/create_user_request.dart';
import 'package:spotify_flutter/domain/repositories/auth/auth_repository.dart';
import 'package:spotify_flutter/domain/usecases/base_use_case.dart';

class SignUpUsecase implements BaseUseCase<Either, CreateUserRequest> {
  final _authRepository = getIt.get<AuthRepository>();

  @override
  Future<Either> call({CreateUserRequest? params}) {
    return _authRepository.signUp(params!);
  }

}