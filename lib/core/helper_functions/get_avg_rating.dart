import 'package:e_commerce_app/core/models/review_model.dart';

num getAvgRating(List<ReviewModel> reviews) {
  if (reviews.isEmpty) return 0;

  var sum = 0;
  for (var review in reviews) {
    sum += review.ratting.toInt();
  }
  return sum / reviews.length;
}
