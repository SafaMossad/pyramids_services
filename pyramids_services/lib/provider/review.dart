import 'dart:convert';

import 'package:pyramidsservices/models/one_service_model.dart';
import 'package:pyramidsservices/models/review_model.dart';

import '../models/category_model.dart';
import '../models/feeds_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReviewProvider with ChangeNotifier {
  final String authToken;
  final String userId;
  List<AllReviewsModel> _allReviews = [];
  ReviewProvider(this.authToken, this.userId, this._allReviews);

  List<AllReviewsModel> get allReviews {
    return [..._allReviews];
  }

  Future<void> addReview(String description) async {
//_items.clear();
    Uri myUrl =
        Uri.parse("https://pyramids-services.herokuapp.com/api/v1/reviews");
    String body = json.encode({"description": "$description"});

    try {
      var response = await http.post(myUrl,
          headers: {
            'Accept': '*/*',
            'Accept-Encoding': 'gzip, deflate, br',
            'Connection': 'keep-alive',
            'Content-Type': 'application/json',
            'Authorization': '$authToken'

          },
          body: body);
      print(json.decode(response.body));
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<List<AllReviewsModel>> fetchAllReviews() async {
//_items.clear();
    Uri myUrl =
        Uri.parse("https://pyramids-services.herokuapp.com/api/v1/reviews");
    try {
      var response = await http.get(myUrl, headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
      });
      print(json.decode(response.body));
      print(json.decode(response.body));
      final extractedData = json.decode(response.body);
      //print(extractedData["user"]["name"]);
      final List<AllReviewsModel> loadedProducts = [];
      extractedData.forEach((reviewData) {
        loadedProducts.add(AllReviewsModel(
          id: reviewData["id"],
          name:reviewData["user"]["name"].toString(),
          description: reviewData["description"],
          userId:reviewData["user_id"].toString(),
        ));
      });
      print(" testgasjdhahjas hahahhhahaha${extractedData[0]["user"]["name"]}");
      _allReviews = loadedProducts;
      notifyListeners();
    } catch (error) {
      print("$error");
      throw error;
    }
  }
}
