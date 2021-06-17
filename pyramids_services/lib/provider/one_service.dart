import 'dart:convert';

import 'package:pyramidsservices/models/one_service_model.dart';

import '../models/category_model.dart';
import '../models/feeds_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OneServiceProvider with ChangeNotifier {
  List<OneServiceModel> _items = [
/*    OneServiceModel(
      id: 1,
      orders: 3,
      evaluation: 1,
      name: "صفا مسعد",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    OneServiceModel(
      id: 1,
      orders: 10,
      evaluation: 1,
      name: "محمد احمد",
      image:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    OneServiceModel(
      id: 2,
      orders: 15,
      evaluation: 1,
      name: "يوسف عكه",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    OneServiceModel(
      id: 3,
      orders: 20,
      evaluation: 1,
      name: "محمد صلاح",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    OneServiceModel(
      id: 4,
      orders: 2,
      evaluation: 1,
      name: "محمود ابراهيم",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    OneServiceModel(
      id: 5,
      orders: 13,
      evaluation: 1,
      name: "احمد حماده",
      image:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    OneServiceModel(
      id: 6,
      orders: 12,
      evaluation: 1,
      name: "ابراهيم عواض ",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    OneServiceModel(
      id: 7,
      orders: 8,
      evaluation: 1,
      name: "كريم طارق",
      image:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    OneServiceModel(
      id: 8,
      orders: 40,
      evaluation: 1,
      name: "احمد محمود",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),
    OneServiceModel(
      id: 9,
      orders: 25,
      evaluation: 1,
      name: "عمرو محمد",
      image:
          'https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
    ),
    OneServiceModel(
      id: 10,
      orders: 29,
      evaluation: 1,
      name: "عمار ابو زيد",
      image:
          'https://images.unsplash.com/photo-1558227691-41ea78d1f631?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
    ),*/
  ];

  List<OneServiceModel> get items {
    return [..._items];
  }

  Future<List<OneServiceModel>> fetchItems(int index) async {
//_items.clear();
    Uri myUrl = Uri.parse("https://pyramids-services.herokuapp.com/api/v1/servies/get_all?index=$index");
    try {
      var response = await http.get(myUrl, headers: {
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'Content-Type': 'application/json',
      });
      print(json.decode(response.body));
      final extractedData = json.decode(response.body);

      final List<OneServiceModel> loadedProducts = [];

      extractedData.forEach((productData) {
        loadedProducts.add(OneServiceModel(
          id: productData['id'],
          title: productData['title'],
          description: productData['describtion'],
          index: productData['index'],
          image: productData['imageurl'],


        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
