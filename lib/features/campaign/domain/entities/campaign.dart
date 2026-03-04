import 'package:equatable/equatable.dart';

class Campaign extends Equatable {
  final int id;
  final String title;
  final String image;
  final int pricePerTree;
  final int numberOfTrees;
  final int targetTrees;
  final String regency;
  final String status;

  const Campaign({
    required this.id,
    required this.title,
    required this.image,
    required this.pricePerTree,
    required this.numberOfTrees,
    required this.targetTrees,
    required this.regency,
    required this.status,
  });

  @override
  List<Object?> get props => [
    id,
    title,
    image,
    pricePerTree,
    numberOfTrees,
    targetTrees,
    regency,
    status,
  ];
}
