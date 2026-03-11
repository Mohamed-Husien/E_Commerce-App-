import 'dart:io';

import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/models/review_model.dart';

class ProductModel {
  final String name;
  final String productCode;
  final num price;
  final String description;
  final File image;
  final bool isFeatured;
  String? imageURL;
  final int expirationMonths;
  bool isOrganic = false;
  final int numberOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int sellingCount;
  final List<ReviewModel> reviews;
  ProductModel(
      {required this.name,
      required this.productCode,
      required this.price,
      required this.description,
      required this.image,
      required this.isFeatured,
      required this.isOrganic,
      required this.expirationMonths,
      required this.numberOfCalories,
      required this.unitAmount,
      required this.reviews,
      this.sellingCount = 0,
      this.imageURL});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      productCode: json['productCode'],
      price: json['price'],
      description: json['description'],
      image: File(json['imageURL']),
      isFeatured: json['isFeatured'],
      expirationMonths: json['expirationMonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: (json['reviews'] as List)
          .map((reviewJson) => ReviewModel.fromJson(reviewJson))
          .toList(),
      sellingCount: json['sellingCount'] ?? 0,
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
      image: image,
      reviews: reviews.map((review) => review.toEntity()).toList(),
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
    };
  }
}
