import 'package:dartz/dartz.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/campaign.dart';
import '../../domain/repositories/campaign_repository.dart';
import '../data_sources/campaign_remote_data_source.dart';

class CampaignRepositoryImpl implements CampaignRepository {
  final CampaignRemoteDataSource remoteDataSource;

  CampaignRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Campaign>>> getCampaigns() async {
    try {
      // 1. Panggil sumber data (JSON dummy kita)
      final remoteCampaigns = await remoteDataSource.getCampaigns();

      // 2. Jika sukses, bungkus dengan Right() dari dartz
      return Right(remoteCampaigns);
    } on ServerException {
      // 3. Jika gagal karena ServerException, bungkus dengan Left()
      return const Left(
        ServerFailure('Gagal mengambil data kampanye. Server Error.'),
      );
    } catch (e) {
      // Tangkap error lain yang tidak terduga (misal JSON formatnya salah)
      return Left(ServerFailure('Terjadi kesalahan: ${e.toString()}'));
    }
  }
}
