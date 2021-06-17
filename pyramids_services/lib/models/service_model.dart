import 'package:flutter/cupertino.dart';

class ServiceModel with ChangeNotifier {
  final String title;
  final int id;
  final String description;
 // final String image;

  ServiceModel({
    @required this.id,
    @required this.title,
    @required this.description,
   // @required this.image,
  });
}
