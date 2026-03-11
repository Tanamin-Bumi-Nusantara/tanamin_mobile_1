import '../../domain/entities/campaign_detail.dart';

abstract class CampaignDetailState {}

class CampaignDetailInitial extends CampaignDetailState {}

class CampaignDetailLoading extends CampaignDetailState {}

class CampaignDetailLoaded extends CampaignDetailState {
  final CampaignDetail campaignDetail;

  CampaignDetailLoaded(this.campaignDetail);
}

class CampaignDetailError extends CampaignDetailState {
  final String message;

  CampaignDetailError(this.message);
}
