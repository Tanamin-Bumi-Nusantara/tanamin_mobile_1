import '../../domain/use_cases/register_user.dart';
import '../models/user_model.dart';
import 'auth_remote_data_source.dart';
import 'dart:convert'; // 1. Untuk json.decode
import 'package:http/http.dart' as http; // 2. Untuk http.Client

import '../../../../core/error/exceptions.dart'; // 3. Import Exception yg dibuat di Langkah 1

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  // 4. CONSTRUCTOR (Solusi error: client must be initialized)
  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> login(String email, String password) async {
    final response = await client.post(
      Uri.parse('https://api.kamu.com/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw ServerException(); // Solusi error: ServerException isn't defined
    }
  }

  // 5. IMPLEMENTASI REGISTER (Solusi error: Missing concrete implementation)
  @override
  Future<UserModel> register(RegisterParams params) async {
    final response = await client.post(
      Uri.parse('https://api.kamu.com/register'),
      // Kirim data manual (bukan pakai toJson model) seperti pembahasan sebelumnya
      body: {
        'first_name': params.firstName,
        'last_name': params.lastName,
        'username': params.username,
        'email': params.email,
        'password': params.password,
      },
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      // Asumsi backend mengembalikan data user yang baru dibuat
      return UserModel.fromJson(json.decode(response.body)['data']);
    } else {
      throw ServerException();
    }
  }
}
