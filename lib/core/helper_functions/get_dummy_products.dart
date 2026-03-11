import 'dart:io';

import 'package:e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "Apple",
    description: "Fresh and juicy apples",
    price: 1.99,
    productCode: '',
    image: File(''),
    isFeatured: true,
    isOrganic: true,
    expirationMonths: 6,
    numberOfCalories: 100,
    unitAmount: 120,
    reviews: [],
    imageURL: 'https://example.com/images/apple.jpg',
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
