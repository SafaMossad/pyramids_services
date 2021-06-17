import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:pyramidsservices/models/all_services_model.dart';
import 'package:pyramidsservices/models/service_model.dart';
import 'package:pyramidsservices/moduels/one_service_screen.dart';
import 'package:pyramidsservices/provider/all_services.dart';
import 'package:pyramidsservices/shared/components/components.dart';
import 'package:pyramidsservices/shared/components/widgets/all_services_item.dart';
import 'package:pyramidsservices/shared/styles/colors.dart';

class AllServices extends StatefulWidget {
  @override
  _AllServicesState createState() => _AllServicesState();
}

class _AllServicesState extends State<AllServices> {
  @override
  Widget build(BuildContext context) {
    final allServicesData = Provider.of<AllServicesData>(context);
    final service = allServicesData.items;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 10,
        title: Text(
          "All Services",
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => ChangeNotifierProvider.value(
                value: service[index],
                child: ServicesItem(index:index),
              ),
              // ServicesItem()
              itemCount: service.length,
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


