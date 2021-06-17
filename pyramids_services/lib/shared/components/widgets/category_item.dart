import 'package:flutter/rendering.dart';
import 'package:pyramidsservices/moduels/group_follow_on_map.dart';
import 'package:pyramidsservices/moduels/languages_screen.dart';
import 'package:pyramidsservices/moduels/parcode_category_screen.dart';
import 'package:pyramidsservices/moduels/report_screen.dart';
import 'package:pyramidsservices/moduels/review_screen.dart';
import 'package:pyramidsservices/moduels/suggestion_screen.dart';
import 'file:///F:/Projects/Flutter2/pyramids_services/pyramids_services/lib/moduels/all_services.dart';
import '../../../moduels/one_service_screen.dart';
import '../../../moduels/tour_guide_screen.dart';

import '../../../models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../components.dart';

class CategoryItem extends StatelessWidget {
  final int index;

  CategoryItem({this.index});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoriesModel>(context, listen: false);
    return GestureDetector(
      // onTap: () => navigateTo(context, CategoryEmployeeScreen()),
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(),
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          //  alignment: AlignmentDirectional.bottomCenter,
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 140.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        categories.image,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            defaultButton(
              function: () {
                if (index == 0) {
                  navigateTo(context, AllServices());
                } else if (index == 1) {
                  navigateTo(context, LanguagesScreen());
                } else if (index == 3) {
                  navigateTo(context, ReviewsScreen());
                  //ReportScreen

                } else if (index == 4) {
                  navigateTo(
                    context,
                    ParCodeScreen(),
                  );
                } else if (index == 5) {
                  navigateTo(
                    context,
                    ReportScreen(),
                  );
                }
                else if (index == 6) {
                  navigateTo(
                    context,
                    SuggestionScreen(),
                  );
                }
                else if (index == 8) {
                  navigateTo(
                    context,
                    ShowGroupOnMap(),
                  );
                }
              },
              context: context,
              text: categories.title,
              radius: 8.0,
              fontSize: 13.0,
              textColor: Colors.black,
              width: 150,isUpperCase:true,
              borderColor: Theme.of(context).primaryColor,
              background: Theme.of(context).accentColor,
            ),
          ],
        ),
      ),
    );
  }
}
