import 'package:equatable/equatable.dart';

// 1. Entitas Utama
class CampaignDetail extends Equatable {
  final int id;
  final String title;
  final String partnerName;
  final String? partnerLogo;
  final bool partnerVerified;
  final int totalVolunteer;
  final String typeOfTrees;
  final int targetTrees;
  final int numberOfTrees;
  final int pricePerTree;
  final String closingDate;
  final String dateOfEvent;
  final String image;
  final String description;
  final String status;
  final List<int> sdgs;
  final LocationEntity location;
  final List<PhotoEntity> photos;

  const CampaignDetail({
    required this.id,
    required this.title,
    required this.partnerName,
    this.partnerLogo,
    required this.partnerVerified,
    required this.totalVolunteer,
    required this.typeOfTrees,
    required this.targetTrees,
    required this.numberOfTrees,
    required this.pricePerTree,
    required this.closingDate,
    required this.dateOfEvent,
    required this.image,
    required this.description,
    required this.status,
    required this.sdgs,
    required this.location,
    required this.photos,
  });

  @override
  List<Object?> get props => [id, title, status];
}

// 2. Entitas Lokasi
class LocationEntity extends Equatable {
  final String province;
  final String regency;
  final String district;
  final String village;
  final double latitude; // Diambil dari koordinat[0]
  final double longitude; // Diambil dari koordinat[1]
  final String locationDescription;

  const LocationEntity({
    required this.province,
    required this.regency,
    required this.district,
    required this.village,
    required this.latitude,
    required this.longitude,
    required this.locationDescription,
  });

  @override
  List<Object?> get props => [province, regency, latitude, longitude];
}

// 3. Entitas Foto
class PhotoEntity extends Equatable {
  final int id;
  final String src;
  final String alt;

  const PhotoEntity({required this.id, required this.src, required this.alt});

  @override
  List<Object?> get props => [id, src];
}
