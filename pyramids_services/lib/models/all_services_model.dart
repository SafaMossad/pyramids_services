import 'package:flutter/cupertino.dart';

class AllServicesModel with ChangeNotifier {
  final String title;
  final int id;
  final String image;

  AllServicesModel({
    @required this.id,
    @required this.title,
    @required this.image,
  });
}
