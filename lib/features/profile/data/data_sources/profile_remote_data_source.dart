import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tanamin_mobile_1/core/error/exceptions.dart';

import '../models/profile_model.dart';

abstract interface class ProfileRemoteDataSource {
  Future<List<ProfileModel>> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<List<ProfileModel>> getProfile() async {
    try {
      await Future.delayed(const Duration(milliseconds: 800));

      final String response = await rootBundle.loadString(
        'assets/json/profile.json',
      );

      final List<dynamic> jsonList = json.decode(response);

      return jsonList.map((json) => ProfileModel.fromJson(json)).toList();
    } catch (e) {
      throw ServerException();
    }
  }
}
