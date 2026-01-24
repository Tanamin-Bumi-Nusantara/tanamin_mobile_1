import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../repositories/auth_repository.dart';

// Class Utama UseCase
class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  // Method call untuk eksekusi
  Future<Either<Failure, User>> call(RegisterParams params) async {
    return await repository.register(
      firstName: params.firstName,
      lastName: params.lastName,
      username: params.username,
      email: params.email,
      password: params.password,
    );
  }
}

// Class Params (Dibuat di file yang sama di bagian bawah)
// Ini berguna untuk membungkus banyak parameter menjadi satu objek
class RegisterParams extends Equatable {
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;

  const RegisterParams({
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [firstName, lastName, username, email, password];
}
