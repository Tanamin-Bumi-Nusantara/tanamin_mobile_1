import 'package:dartz/dartz.dart';
import 'package:tanamin_mobile_1/features/profile/domain/repositories/profile_repository.dart';

import '../../../../core/error/failures.dart';
import '../entities/profile.dart';

class GetProfileUseCase {
  final ProfileRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, List<Profile>>> call() async {
    return await repository.getProfile();
  }
}
