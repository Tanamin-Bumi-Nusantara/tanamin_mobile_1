import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_campaigns_usecase.dart';
import 'campaign_event.dart';
import 'campaign_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  final GetCampaignsUseCase getCampaignsUseCase;

  CampaignBloc({required this.getCampaignsUseCase}) : super(CampaignInitial()) {
    on<FetchCampaignsEvent>((event, emit) async {
      emit(CampaignLoading());

      final failureOrCampaigns = await getCampaignsUseCase(); // Panggil UseCase

      failureOrCampaigns.fold(
        (failure) => emit(CampaignError("Gagal mengambil data")),
        (campaigns) => emit(CampaignLoaded(campaigns)),
      );
    });
  }
}
