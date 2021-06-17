import 'dart:convert';

import 'package:pyramidsservices/models/toure_guide.dart';
import 'package:http/http.dart' as http;
import '../models/category_model.dart';
import '../models/feeds_model.dart';
import 'package:flutter/material.dart';

class TourGuideProvider with ChangeNotifier {
  List<TourGuideModel> _items = [];

  List<TourGuideModel> get items {
    return [..._items];
  }

  Future<List<TourGuideModel>> fetchAllToureGuide(int index) async {
    //_items.clear();
    Uri myUrl = Uri.parse(
        "https://pyramids-services.herokuapp.com/api/v1/tourguides/get_all?index=$index");
    try {
      var response = await http.get(myUrl, headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
      });
      print(json.decode(response.body));
      final extractedData = json.decode(response.body);

      final List<TourGuideModel> loadedGuide = [];

      extractedData.forEach(
        (tourGuideData) {
          loadedGuide.add(
            TourGuideModel(
              id: tourGuideData['id'],
              name: tourGuideData['name'],
              language: tourGuideData['language'],
            ),
          );
        },
      );
      _items = loadedGuide;
      notifyListeners();
    } catch (error) {
      print("Errrror $error");
      throw error;
    }
  }
}
