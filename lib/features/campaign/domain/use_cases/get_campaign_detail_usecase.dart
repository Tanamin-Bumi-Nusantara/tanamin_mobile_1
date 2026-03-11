import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/campaign_detail.dart';
import '../repositories/campaign_repository.dart';

class GetCampaignDetailUseCase {
  final CampaignRepository repository;

  GetCampaignDetailUseCase(this.repository);

  Future<Either<Failure, CampaignDetail>> call(int id) async {
    return await repository.getCampaignDetail(id);
  }
}
