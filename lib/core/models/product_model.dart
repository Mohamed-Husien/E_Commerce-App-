import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/helper_functions/get_avg_rating.dart';
import 'package:e_commerce_app/core/models/review_model.dart';

class ProductModel {
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
  final num avgRating;
  final num ratingCount = 0;
  final int sellingCount;
  final List<ReviewModel> reviews;
  ProductModel(
      {required this.name,
      required this.productCode,
      required this.price,
      required this.description,
      required this.isFeatured,
      required this.isOrganic,
      required this.avgRating,
      required this.expirationMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.reviews,
      this.sellingCount = 0,
      this.imageURL,
      required this.code});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    List<ReviewModel> reviewsList = [];

    if (json['reviews'] != null) {
      reviewsList = (json['reviews'] as List)
          .map((e) => ReviewModel.fromJson(Map<String, dynamic>.from(e)))
          .toList();
    }
    return ProductModel(
      avgRating: getAvgRating(reviewsList),
      name: json['name'],
      productCode: json['productCode'],
      price: json['price'],
      description: json['description'],
      isFeatured: json['isFeatured'],
      expirationMonths: json['expirationMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      imageURL: json["imageURL"],
      reviews: reviewsList,
      sellingCount: json['sellingCount'] ?? 0,
      code: json['code'],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      productCode: productCode,
      price: price,
      description: description,
      imageURL: imageURL ?? '',
      isFeatured: isFeatured,
      expirationMonths: expirationMonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews.map((review) => review.toEntity()).toList(),
      code: code,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "productCode": productCode,
      "price": price,
      "description": description,
      "isFeatured": isFeatured,
      "expirationMonths": expirationMonths,
      "isOrganic": isOrganic,
      "numberOfCalories": numberOfCalories,
      "unitAmount": unitAmount,
      "imageURL": imageURL,
      "reviews": reviews.map((review) => review.toJson()).toList(),
      "sellingCount": sellingCount,
      "code": code
    };
  }
}
