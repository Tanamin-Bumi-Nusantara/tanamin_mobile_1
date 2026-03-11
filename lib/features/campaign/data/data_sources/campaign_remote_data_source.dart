import 'dart:convert'; //json.function
import 'package:flutter/services.dart'; //rootBundle
import '../../../../core/error/exceptions.dart'; //ServerException
import '../models/campaign_model.dart';
import '../models/campaign_detail_model.dart';

abstract class CampaignRemoteDataSource {
  // Kontrak 1: Ambil semua kampanye
  Future<List<CampaignModel>> getCampaigns();

  // Kontrak 2: Ambil detail spesifik kampanye berdasarkan ID
  Future<CampaignDetailModel> getCampaignDetail(int id);
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

  @override
  Future<CampaignDetailModel> getCampaignDetail(int id) async {
    try {
      // Simulasi loading
      await Future.delayed(const Duration(milliseconds: 500));

      final String response = await rootBundle.loadString(
        'assets/json/campaign_details.json',
      );
      final List<dynamic> jsonList = json.decode(response);

      // Mencari campaign yang ID-nya cocok dengan yang diminta
      final campaignJson = jsonList.firstWhere(
        (element) => element['id'] == id,
        orElse: () =>
            throw ServerException(), // Lempar error jika ID tidak ditemukan
      );

      return CampaignDetailModel.fromJson(campaignJson);
    } catch (e) {
      throw ServerException();
    }
  }
}
