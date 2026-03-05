import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int id;
  final String name;
  final String email;
  final String role;
  final String status;
  final String joinDate;

  const Profile({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.joinDate,
  });

  @override
  List<Object?> get props => [id, name, email, role, status, joinDate];
}
