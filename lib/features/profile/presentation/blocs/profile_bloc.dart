import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_profile_usecase.dart';
import 'profile_state.dart';
import 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getProfileUseCase;

  ProfileBloc({required this.getProfileUseCase}) : super(ProfileInitial()) {
    on<FetchProfileEvent>((event, emit) async {
      emit(ProfileLoading());

      final failureOrProfile = await getProfileUseCase();

      failureOrProfile.fold(
        (failure) => emit(ProfileError("Gagal mengambil data")),
        (profile) => emit(ProfileLoaded(profile)),
      );
    });
  }
}
