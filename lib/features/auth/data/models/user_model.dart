import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.uuid,
    required super.firstName,
    required super.lastName,
    required super.username,
    required super.email,
    required super.role,
    required super.emailVerifiedAt,
    required super.lastLoginAt,
  });

  // Konversi dari JSON (Response API) ke Object Dart
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      uuid: json['uuid'],
      firstName: json['first_name'], // Sesuai snake_case di database/json
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'],
      role: json['role'] ?? 'masyarakat', // Default jika null
      // Parse tanggal
      emailVerifiedAt: json['last_login_at'] != null
          ? DateTime.parse(json['last_login_at'])
          : null,
      lastLoginAt: json['last_login_at'] != null
          ? DateTime.parse(json['last_login_at'])
          : null,
    );
  }

  // Konversi ke JSON untuk dikirim ke API
  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': email,
      'role': role,
      // Password biasanya dikirim terpisah saat request, bukan di dalam model User yang disimpan
    };
  }
}
