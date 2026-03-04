import 'dart:convert';
import 'package:flutter/services.dart';
import '../../../../core/error/exceptions.dart';
import '../models/campaign_model.dart';

abstract class CampaignRemoteDataSource {
  Future<List<CampaignModel>> getCampaigns();
}

class CampaignRemoteDataSourceImpl implements CampaignRemoteDataSource {
  @override
  Future<List<CampaignModel>> getCampaigns() async {
    try {
      // Delay buatan agar seolah-olah loading dari internet (opsional)
      await Future.delayed(const Duration(milliseconds: 800));

      // Membaca file JSON lokal
      final String response = await rootBundle.loadString(
        'assets/json/campaigns.json',
      );

      // Mengubah string JSON menjadi List of Map
      final List<dynamic> jsonList = json.decode(response);

      // Mapping ke CampaignModel
      return jsonList.map((json) => CampaignModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
