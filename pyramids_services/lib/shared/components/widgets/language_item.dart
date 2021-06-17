import 'package:flutter/rendering.dart';
import 'package:pyramidsservices/models/language_model.dart';
import '../../../moduels/one_service_screen.dart';
import '../../../moduels/tour_guide_screen.dart';

import '../../../models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../components.dart';

class LanguagesItem extends StatelessWidget {
  final int index;

  LanguagesItem({this.index});

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<LanguagesModel>(context, listen: false);
    return GestureDetector(
      // onTap: () => navigateTo(context, LanguagesEmployeeScreen()),
      child: Container(
        decoration: BoxDecoration(
          //border: Border.all(),
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          //  alignment: AlignmentDirectional.bottomCenter,
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        categories.image,
                      ),
                      fit: BoxFit.contain),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                child: defaultButton(
                  function: () {
                    navigateTo(context, TourGuideScreen(languageIndex:index));
                  },
                  context: context,
                  text: categories.title,
                  radius: 8.0,
                  fontSize: 16.0,
                  textColor: Colors.black,
                  width: 150,
                  borderColor: Theme.of(context).primaryColor,
                  background: Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
