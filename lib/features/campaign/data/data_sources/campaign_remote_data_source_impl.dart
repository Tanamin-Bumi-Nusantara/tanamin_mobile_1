import 'campaign_remote_data_source.dart';

class CampaignRemoteDataSourceImpl implements CampaignRemoteDataSource {
  const CampaignRemoteDataSourceImpl();

  Future<T> _run<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      rethrow;
    }
  }
}
