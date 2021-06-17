import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:pyramidsservices/models/toure_guide.dart';
import 'package:pyramidsservices/provider/contact_tourguide.dart';


import '../models/feeds_model.dart';
import '../provider/categories.dart';
import '../provider/toure_guide.dart';
import '../shared/components/components.dart';
import '../shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class TourGuideScreen extends StatelessWidget {
  final int languageIndex ;
  TourGuideScreen({this.languageIndex});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 12.0,
        titleSpacing: 20.0,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            "All Tour Guide",
            style: TextStyle(color: Colors.black),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
      body: FutureBuilder(
          future: Provider.of<TourGuideProvider>(context, listen: false)
              .fetchAllToureGuide(languageIndex),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("waiting");
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                print("error snap  error ${snapshot.error}");
                return Center(
                  child: Text('An error occurred!'),
                );
              } else {
                print("success $snapshot");
                return Consumer<TourGuideProvider>(
                  builder: (ctx, oneServiceData, child) =>
                      SingleChildScrollView(
                        child: Container(
                          child: Column(children: [
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  buildEmployeeItem(context:context, model:oneServiceData.items[index]),
                              itemCount: oneServiceData.items.length,
                              separatorBuilder: (context, index) => SizedBox(
                                height: 10.0,
                              ),
                            )
                          ]),
                        ),
                      ),
                );
              }
            }
          }),

    );
  }

  final String imageLink =
      "https://images.unsplash.com/photo-1505798577917-a65157d3320a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";

  Widget buildEmployeeItem({context, TourGuideModel model}) => Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Padding(
                        padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                        child: CircleAvatar(
                          radius: 27,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(imageLink),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(
                              model.name,
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text(
                              "${model.language}",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8.0, right: 10.0),
                        child: defaultButton(
                          borderColor: Theme.of(context).primaryColor,
                          function: () {

                            Provider.of<ContactTourGuideProvider>(context).addContactTourGuide(model.id);
                          },
                          text: "Contact",
                          fontSize: 14.0,
                          isUpperCase: false,
                          context: context,
                          width: 85,
                          radius: 15.0,
                          textColor: Colors.black,
                          background: Theme.of(context).accentColor,
                        ),
                      ),
                      //for red dot and picture
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
