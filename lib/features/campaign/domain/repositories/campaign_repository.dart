import 'package:dartz/dartz.dart'; //Either
import '../../../../core/error/failures.dart'; //Failure
import '../entities/campaign.dart';
import '../entities/campaign_detail.dart';

abstract class CampaignRepository {
  // Fungsi ambil banyak data
  // Kontrak: Fungsi ini wajib mengembalikan List<Campaign> jika sukses (Right),
  // atau Failure jika gagal (Left).
  Future<Either<Failure, List<Campaign>>> getCampaigns();

  // Fungsi ambil 1 data spesifik
  Future<Either<Failure, CampaignDetail>> getCampaignDetail(int id);
}
