import 'package:flutter/material.dart';

class OneServiceModel with ChangeNotifier {
  final int id;
  final String title;
  final String description;
  final String index;
  final String image;
  final String xDirection;
  final String yDirection;

  OneServiceModel({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.index,
    @required this.image,
    @required this.xDirection,
    @required this.yDirection,

  });
}
