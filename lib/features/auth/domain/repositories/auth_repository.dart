import 'package:dartz/dartz.dart'; // Import dartz
import '../../../../core/error/failures.dart'; // Import Failure
import '../../domain/entities/user.dart';

abstract class AuthRepository {
  // Definisikan method register di sini
  Future<Either<Failure, User>> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  });

  // Method login (opsional jika belum mau dibuat)
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });
}
