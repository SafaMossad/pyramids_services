import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../models/one_service_model.dart';
import '../moduels/show_on_map.dart';
import '../provider/one_service.dart';
import '../shared/components/components.dart';

class OneService extends StatefulWidget {
  final int index;
  final String title;

  OneService({this.index, this.title});

  @override
  _OneServiceState createState() => _OneServiceState();
}

class _OneServiceState extends State<OneService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "${widget.title}",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: Provider.of<OneServiceProvider>(context, listen: false)
              .fetchItems(widget.index),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              print("waiting");
              return Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasError) {
                print("error snap  error ${snapshot.error}");
                return SnackBar(content: Text("error"));
              } else {
                print("success $snapshot");
                return Consumer<OneServiceProvider>(
                  builder: (ctx, oneServiceData, child) =>
                      SingleChildScrollView(
                          child: oneServiceData.items.length <= 0
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 350.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Center(
                                        child: Text(
                                            "There Is no Services Please Add Some"),
                                      ),
                                    ],
                                  ),
                                )
                              : Container(
                                  child: Column(children: [
                                    ListView.separated(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) =>
                                          serviceItem(context,
                                              oneServiceData.items[index]),
                                      itemCount: oneServiceData.items.length,
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: 10.0,
                                      ),
                                    )
                                  ]),
                                )),
                );
              }
            }
          }),
    );
  }
}

Widget serviceItem(context, OneServiceModel service) {
  return Padding(
    padding: const EdgeInsets.only(top: 12.0),
    child: Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10.0,
      margin: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${service.title}',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              "${service.description}",
              style: Theme.of(context).textTheme.subtitle1.copyWith(),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              textDirection: TextDirection.ltr,
            ),
            if (service.image != '')
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 15.0),
              child: Container(
                height: 140.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    4.0,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${service.image}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            InkWell(
              onTap: () {
                navigateTo(
                    context,
                    ShowOnMap(
                      xDirection: double.parse(
                        service.xDirection,
                      ),
                      yDirection: double.parse(
                        service.yDirection,
                      ),
                    ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Show on Map",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Theme.of(context).accentColor),
                  ),
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).accentColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
