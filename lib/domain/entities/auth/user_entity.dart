import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String password;

  const UserEntity({
    this.id = '',
    this.email = '',
    this.password = '',
  });

  @override
  String toString() =>
      'UserEntity { id: $id, email: $email, password: $password }';

  @override
  List<Object?> get props => [id, email, password];
}