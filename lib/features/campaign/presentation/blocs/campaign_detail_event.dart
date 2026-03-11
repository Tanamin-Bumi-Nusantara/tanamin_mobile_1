abstract class CampaignDetailEvent {}

class FetchCampaignDetailEvent extends CampaignDetailEvent {
  final int id;

  FetchCampaignDetailEvent(this.id);
}
