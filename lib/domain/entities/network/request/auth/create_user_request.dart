import 'package:equatable/equatable.dart';

class CreateUserRequest extends Equatable {
  final String name;
  final String email;
  final String password;

  const CreateUserRequest({
    this.name = '',
    this.email = '',
    this.password = '',
  });

  @override
  String toString() =>
      'CreateUserRequest { name: $name, email: $email, password: $password }';

  @override
  List<Object?> get props => [name, email, password];
}