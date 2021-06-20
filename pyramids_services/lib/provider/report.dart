import 'dart:convert';

import 'package:pyramidsservices/models/one_service_model.dart';
import 'package:pyramidsservices/models/report_model.dart';
import 'package:pyramidsservices/models/review_model.dart';

import '../models/category_model.dart';
import '../models/feeds_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ReportsProvider with ChangeNotifier {
  final String authToken;
  final String userId;

  ReportsProvider(this.authToken, this.userId,);




  Future<void> addReport(String description) async {
//_items.clear();
    Uri myUrl =
        Uri.parse("https://pyramids-services.herokuapp.com/api/v1/reports");
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

//  Future<List<ReportModel>> fetchAllReport() async {
////_items.clear();
//    Uri myUrl =
//        Uri.parse("https://pyramid-services.herokuapp.com/api/v1/reviews");
//    try {
//      var response = await http.get(myUrl, headers: {
//        'Accept': '*/*',
//        'Accept-Encoding': 'gzip, deflate, br',
//        'Connection': 'keep-alive',
//        'Content-Type': 'application/json',
//      });
//      print(json.decode(response.body));
//      print(json.decode(response.body));
//      final extractedData = json.decode(response.body);
//      //print(extractedData["user"]["name"]);
//      final List<AllReportModel> loadedProducts = [];
//      extractedData.forEach((reviewData) {
//        loadedProducts.add(AllReportModel(
//          id: reviewData["id"],
//          /*name:,*/
//          description: reviewData["description"], /*userId:,*/
//        ));
//      });
//      _allReport = loadedProducts;
//      notifyListeners();
//    } catch (error) {
//      print("$error");
//      throw error;
//    }
//  }
}
