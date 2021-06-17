import '../models/language_model.dart';

import 'package:flutter/material.dart';

class Languages with ChangeNotifier {
  List<LanguagesModel> _items = [
    LanguagesModel(
      id: 1,
      title: "Arabic",
      image: 'https://image.flaticon.com/icons/png/512/323/323324.png',
    ),
    LanguagesModel(
      id: 2,
      title: "English",
      image: 'https://image.flaticon.com/icons/png/512/197/197374.png',
    ),
    LanguagesModel(
      id: 3,
      title: "French",
      image: 'https://image.flaticon.com/icons/png/512/197/197560.png',
    ),
    LanguagesModel(
      id: 4,
      title: "Spanish",
      image: 'https://image.flaticon.com/icons/png/512/197/197593.png',
    ),
    LanguagesModel(
      id: 5,
      title: "German",
      image: 'https://image.flaticon.com/icons/png/512/197/197571.png',
    ),
    LanguagesModel(
      id: 6,
      title: "Italy",
      image: 'https://image.flaticon.com/icons/png/512/323/323325.png',
    ),


  ];

  List<LanguagesModel> get items {
    return [..._items];
  }
}
