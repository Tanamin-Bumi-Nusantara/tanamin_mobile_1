import '../../domain/entities/profile.dart';

class ProfileModel extends Profile {
  const ProfileModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    required super.status,
    required super.joinDate,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      role: json['role'],
      status: json['status'],
      joinDate: json['join_date'],
    );
  }
}
