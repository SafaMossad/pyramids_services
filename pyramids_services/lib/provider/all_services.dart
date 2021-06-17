import 'package:pyramidsservices/models/all_services_model.dart';

import '../models/category_model.dart';
import '../models/feeds_model.dart';
import 'package:flutter/material.dart';

class AllServicesData with ChangeNotifier {
  List<AllServicesModel> _items = [
    AllServicesModel(
      id: 1,
      title: "Hospitals",
      image: 'assets/services/hospital.png',
    ),
    AllServicesModel(
      id: 2,
      title: "Restaurants",
      image: 'assets/services/resturant.png',
    ),
    AllServicesModel(
      id: 3,
      title: "Hostels",
      image: 'assets/services/hostel.png',
    ),
    AllServicesModel(
      id: 4,
      title: "Police Stations",
      image: 'assets/services/police.png',
    ),
    AllServicesModel(
      id: 5,
      title: "ATM",
      image: 'assets/services/atm.png',
    ),

    AllServicesModel(
      id: 9,
      title: "Houses of Worship",
      image: 'assets/services/mosq.png',
    ),

  ];

  List<AllServicesModel> get items {
    return [..._items];
  }
}
