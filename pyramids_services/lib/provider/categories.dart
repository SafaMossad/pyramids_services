import '../models/category_model.dart';
import '../models/feeds_model.dart';
import 'package:flutter/material.dart';

class Categories with ChangeNotifier {
  List<CategoriesModel> _items = [
    CategoriesModel(
      id: 1,
      title: "Services",
      image: 'assets/services.png',
    ),
    CategoriesModel(
      id: 2,
      title: "Tour Guide",
      image: 'assets/guide.png',
    ),
    CategoriesModel(
      id: 3,
      title: "Game",
      image: 'assets/game.png',
    ),
    CategoriesModel(
      id: 4,
      title: "Review",
      image: 'assets/review.png',
    ),
    CategoriesModel(
      id: 5,
      title: "ParCode",
      image: 'assets/barcode.png',
    ),
    CategoriesModel(
      id: 6,
      title: "Report",
      image: 'assets/report.png',
    ),
    CategoriesModel(
      id: 7,
      title: "Suggestion ",
      image: 'assets/suggestion.png',
    ),
    CategoriesModel(
      id: 8,
      title: "Pyramids 3D ",
      image: 'assets/3d.png',
    ),
    CategoriesModel(
      id: 9,
      title: "Save Your Group ",
      image: 'assets/suggestion.png',
    ),

  ];

  List<CategoriesModel> get items {
    return [..._items];
  }
}
