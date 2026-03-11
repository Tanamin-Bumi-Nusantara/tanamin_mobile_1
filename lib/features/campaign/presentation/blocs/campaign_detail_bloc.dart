import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/use_cases/get_campaign_detail_usecase.dart';
import 'campaign_detail_event.dart';
import 'campaign_detail_state.dart';

class CampaignDetailBloc
    extends Bloc<CampaignDetailEvent, CampaignDetailState> {
  final GetCampaignDetailUseCase getCampaignDetailUseCase;

  CampaignDetailBloc({required this.getCampaignDetailUseCase})
    : super(CampaignDetailInitial()) {
    on<FetchCampaignDetailEvent>((event, emit) async {
      emit(CampaignDetailLoading());

      // Memanggil UseCase dengan membawa ID dari event
      final failureOrDetail = await getCampaignDetailUseCase(event.id);

      failureOrDetail.fold(
        (failure) =>
            emit(CampaignDetailError("Gagal mengambil detail kampanye")),
        (detail) => emit(CampaignDetailLoaded(detail)),
      );
    });
  }
}
