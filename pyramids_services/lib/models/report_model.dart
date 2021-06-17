import 'package:flutter/cupertino.dart';

class ReportModel with ChangeNotifier {
  final String description;
  ReportModel({
    @required this.description,

  });
}

class AllReportsModel with ChangeNotifier {
  final int id;
  final String description;
  final String userId;
  final String name;
  AllReportsModel({
    @required this.id,
    @required this.description,
    @required this.userId,
    @required this.name,

  });
}
