import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/campaign.dart';
import '../repositories/campaign_repository.dart';

class GetCampaignsUseCase {
  final CampaignRepository repository;

  // Menerima repository dari Dependency Injection
  GetCampaignsUseCase(this.repository);

  // Fungsi call() membuat class ini bisa dipanggil layaknya function biasa
  Future<Either<Failure, List<Campaign>>> call() async {
    return await repository.getCampaigns();
  }
}
