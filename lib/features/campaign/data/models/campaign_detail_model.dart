import '../../domain/entities/campaign_detail.dart';

class CampaignDetailModel extends CampaignDetail {
  const CampaignDetailModel({
    required super.id,
    required super.title,
    required super.partnerName,
    super.partnerLogo,
    required super.partnerVerified,
    required super.totalVolunteer,
    required super.typeOfTrees,
    required super.targetTrees,
    required super.numberOfTrees,
    required super.pricePerTree,
    required super.closingDate,
    required super.dateOfEvent,
    required super.image,
    required super.description,
    required super.status,
    required super.sdgs,
    required super.location,
    required super.photos,
  });

  factory CampaignDetailModel.fromJson(Map<String, dynamic> json) {
    return CampaignDetailModel(
      id: json['id'],
      title: json['title'],
      partnerName: json['partner_name'],
      partnerLogo: json['partner_logo'],
      partnerVerified:
          json['partner_verified'] ?? false, // Default false jika null
      // Menangani typo dari backend (volunteer vs volunter)
      totalVolunteer: json['total_volunteer'] ?? json['total_volunter'] ?? 0,
      typeOfTrees: json['type_of_trees'] ?? '',
      targetTrees: json['target_trees'] ?? 0,
      numberOfTrees: json['number_of_trees'] ?? 0,
      pricePerTree: json['price_per_tree'] ?? 0,
      closingDate: json['closing_date'] ?? '',
      dateOfEvent: json['date_of_event'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? '',
      // Menangani jika sdgs atau photos tidak dikirim oleh backend (seperti di item ke-4)
      sdgs: json['sdgs'] != null ? List<int>.from(json['sdgs']) : [],
      location: LocationModel.fromJson(json['location']),
      photos: json['photos'] != null
          ? (json['photos'] as List).map((p) => PhotoModel.fromJson(p)).toList()
          : [],
    );
  }
}

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.province,
    required super.regency,
    required super.district,
    required super.village,
    required super.latitude,
    required super.longitude,
    required super.locationDescription,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    // Mengekstrak Array koordinat menjadi Lat Long
    double lat = 0.0;
    double long = 0.0;
    if (json['koordinat'] != null && (json['koordinat'] as List).length >= 2) {
      lat = json['koordinat'][0].toDouble();
      long = json['koordinat'][1].toDouble();
    }

    return LocationModel(
      province: json['province'] ?? '',
      regency: json['regency'] ?? '',
      district: json['district'] ?? '',
      village: json['village'] ?? '',
      latitude: lat,
      longitude: long,
      locationDescription: json['lokasi_deskripsi'] ?? '',
    );
  }
}

class PhotoModel extends PhotoEntity {
  const PhotoModel({required super.id, required super.src, required super.alt});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      src: json['src'] ?? '',
      alt: json['alt'] ?? '',
    );
  }
}
