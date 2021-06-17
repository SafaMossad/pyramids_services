import 'package:flutter/cupertino.dart';

class ReviewModel with ChangeNotifier {
  final String description;
  ReviewModel({
    @required this.description,

  });
}

class AllReviewsModel with ChangeNotifier {
  final int id;
  final String description;
  final String userId;
  final String name;
  AllReviewsModel({
    @required this.id,
    @required this.description,
    @required this.userId,
    @required this.name,

  });
}
