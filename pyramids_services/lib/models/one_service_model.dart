import 'package:flutter/material.dart';

class OneServiceModel with ChangeNotifier {
  final int id;
  final String title;
  final String description;
  final String index;
  final String image;
  /*final int orders;
  final String image;
  final int evaluation;*/

  OneServiceModel({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.index,
    @required this.image,
    /*@required this.orders,
    @required this.evaluation,
    @required this.image,*/
  });
}
