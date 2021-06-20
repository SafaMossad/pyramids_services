import 'dart:convert';

import 'package:pyramidsservices/models/one_service_model.dart';
import 'package:pyramidsservices/models/review_model.dart';

import '../models/category_model.dart';
import '../models/feeds_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ContactTourGuideProvider with ChangeNotifier {
  final String authToken;
  final String userId;

  ContactTourGuideProvider(
    this.authToken,
    this.userId,
  );



  Future<void> addContactTourGuide( int tourGuide) async {
//_items.clear();
    Uri myUrl =
        Uri.parse("https://pyramids-services.herokuapp.com/api/v1/contacts");
    String body = json.encode({"user_id": userId, "tourguides_id": 1});
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
}
