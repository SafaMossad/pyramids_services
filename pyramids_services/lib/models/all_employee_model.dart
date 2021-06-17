import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class EmployeeProfileModel with ChangeNotifier {
  final int id;
  final String image;
  final String name;
  final int evaluation;
  final String location;
  final String phone;
  final int orders;
  final String description;

  EmployeeProfileModel(
      {@required this.id,
      @required this.name,
      @required this.orders,
      @required this.evaluation,
      @required this.phone,
      @required this.location,
      @required this.image,
      @required this.description});
}
