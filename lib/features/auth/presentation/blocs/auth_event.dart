part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class RegisterSubmittedEvent extends AuthEvent {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;

  const RegisterSubmittedEvent({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
  });
}
