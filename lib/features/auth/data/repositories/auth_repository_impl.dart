import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/use_cases/register_user.dart';
import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  // Constructor ini akan diisi oleh Injection Container (get_it)
  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      // 1. Panggil Remote Data Source
      // Kita buat object params manual di sini untuk dikirim ke datasource
      // (Atau bisa juga import RegisterParams jika datasource memintanya)
      final remoteUser = await remoteDataSource.register(
        RegisterParams(
          firstName: firstName,
          lastName: lastName,
          username: username,
          email: email,
          password: password,
        ),
      );

      // 2. Jika sukses, kembalikan data User (Right)
      return Right(remoteUser);
    } on ServerException {
      // 3. Jika terjadi ServerException, tangkap dan ubah jadi Failure (Left)
      return const Left(ServerFailure('Server Error saat Registrasi'));
    } catch (e) {
      // Tangkap error lain yang tidak terduga
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final remoteUser = await remoteDataSource.login(email, password);
      return Right(remoteUser);
    } on ServerException {
      return const Left(ServerFailure('Email atau Password salah'));
    }
  }
}
