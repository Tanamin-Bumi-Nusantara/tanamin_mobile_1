import '../../domain/entities/campaign.dart';

class CampaignModel extends Campaign {
  const CampaignModel({
    required super.id,
    required super.title,
    required super.image,
    required super.pricePerTree,
    required super.numberOfTrees,
    required super.targetTrees,
    required super.regency,
    required super.status,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      pricePerTree: json['price_per_tree'],
      numberOfTrees: json['number_of_trees'],
      targetTrees: json['target_trees'],
      regency:
          json['location']['regency'], // Mengambil regency dari dalam location
      status: json['status'],
    );
  }
}
