import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/user.dart';
import '../../domain/use_cases/register_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RegisterUser registerUser;

  AuthBloc({required this.registerUser}) : super(AuthInitial()) {
    on<RegisterSubmittedEvent>((event, emit) async {
      emit(AuthLoading()); // 1. Ubah state jadi Loading

      // 2. Panggil UseCase
      final result = await registerUser(
        RegisterParams(
          firstName: event.firstName,
          lastName: event.lastName,
          username: event.username,
          email: event.email,
          password: event.password,
        ),
      );

      // 3. Cek hasil (Either Success atau Failure)
      result.fold(
        (failure) => emit(AuthFailure(failure.message)), // Jika Gagal
        (user) => emit(AuthSuccess(user)), // Jika Berhasil
      );
    });
  }
}
