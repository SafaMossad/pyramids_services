import 'dart:convert';

import 'package:pyramidsservices/models/bazar_model.dart';
import 'package:pyramidsservices/models/one_service_model.dart';

import '../models/category_model.dart';
import '../models/feeds_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BazarProvider with ChangeNotifier {
  final String authToken;
  final String userId;
  List<BazarModel> _items = [];

  BazarProvider(this.authToken, this.userId, this._items);

  List<BazarModel> get items {
    return [..._items];
  }

  Future<List<BazarModel>> fetchItems(int index) async {
//_items.clear();
    Uri myUrl = Uri.parse(
        "https://pyramids-services.herokuapp.com/api/v1/servies/get_all?index=$index");
    try {
      var response = await http.get(myUrl, headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
        'Authorization': '$authToken'
      });
      print(json.decode(response.body));
      final extractedData = json.decode(response.body);

      final List<BazarModel> loadedProducts = [];

      extractedData.forEach((productData) {
        loadedProducts.add(BazarModel(
          id: productData['id'],
          title: productData['title'],
          description: productData['describtion'],
          index: productData['index'],
          image: productData['imageurl'],
          xDirection: productData['x_direction'],
          yDirection: productData['y_deriction'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
