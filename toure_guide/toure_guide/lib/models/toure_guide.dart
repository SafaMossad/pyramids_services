import 'package:flutter/cupertino.dart';
import 'package:pyramidsservices/moduels/tour_guide_screen.dart';
import 'package:pyramidsservices/moduels/tour_guide_screen.dart';

class TourGuideModel with ChangeNotifier {
  final int id;
  final String name;
  final String language;

  TourGuideModel({
    @required this.id,
    @required this.name,
    @required this.language,
  });
}
