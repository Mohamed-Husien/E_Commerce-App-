import 'package:e_commerce_app/core/entities/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "Apple",
    description: "Fresh and juicy apples",
    price: 1.99,
    productCode: '',
    isFeatured: true,
    isOrganic: true,
    expirationMonths: 6,
    numberOfCalories: 100,
    unitAmount: 120,
    reviews: const [],
    imageURL: null,
    code: "05dd0",
  );
}

List<ProductEntity> getDummyProducts() {
  return List.generate(10, (index) => getDummyProduct());
}
