import 'package:e_commerce_app/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String name;
  final String productCode;
  final num price;
  final String code;
  final String description;
  final bool isFeatured;
  String? imageURL;
  final int expirationMonths;
  bool isOrganic = false;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewEntity> reviews;
  ProductEntity(
      {required this.name,
      required this.productCode,
      required this.price,
      required this.description,
      required this.isFeatured,
      required this.isOrganic,
      required this.expirationMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.reviews,
      this.imageURL,
      required this.code});

  @override
  List<Object?> get props => [code];
}
