import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/campaign.dart';

abstract class CampaignRepository {
  // Kontrak: Fungsi ini wajib mengembalikan List<Campaign> jika sukses (Right),
  // atau Failure jika gagal (Left).
  Future<Either<Failure, List<Campaign>>> getCampaigns();
}
