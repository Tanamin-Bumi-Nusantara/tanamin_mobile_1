import 'package:dartz/dartz.dart';
import 'package:tanamin_mobile_1/core/error/exceptions.dart';
import 'package:tanamin_mobile_1/features/profile/data/data_sources/profile_remote_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/profile.dart';
import '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Profile>>> getProfile() async {
    try {
      final remoteProfile = await remoteDataSource.getProfile();

      return Right(remoteProfile);
    } on ServerException {
      return const Left(
        ServerFailure('Gagal Mengambil data profile. Server Error.'),
      );
    } catch (e) {
      return Left(ServerFailure('Terjadi kesalahan: ${e.toString()}'));
    }
  }
}
