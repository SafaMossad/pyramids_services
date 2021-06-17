import 'package:flutter/cupertino.dart';

class LanguagesModel with ChangeNotifier {
  final String title;
  final int id;
  final String image;

  LanguagesModel({
    @required this.id,
    @required this.title,
    @required this.image,
  });
}
