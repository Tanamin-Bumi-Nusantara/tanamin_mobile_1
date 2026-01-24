import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String uuid;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String role; // 'masyarakat' atau 'perusahaan'
  final DateTime? emailVerifiedAt;
  final DateTime? lastLoginAt;

  const User({
    required this.id,
    required this.uuid,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.role,
    this.emailVerifiedAt,
    this.lastLoginAt,
  });

  @override
  List<Object?> get props => [id, uuid, email];
}
