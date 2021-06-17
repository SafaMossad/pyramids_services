import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pyramidsservices/models/all_services_model.dart';
import 'package:pyramidsservices/moduels/one_service_screen.dart';
import 'package:pyramidsservices/shared/components/components.dart';
import 'package:pyramidsservices/shared/styles/colors.dart';

class ServicesItem extends StatelessWidget {
  int index;

  ServicesItem({this.index});

  @override
  Widget build(BuildContext context) {
    final allServicesData = Provider.of<AllServicesModel>(context);

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
                '${allServicesData.title}',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(
                height: 4.0,
              ),

              //if(model.postImage != '')
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 15.0),
                child: Container(
                  height: 160.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      4.0,
                    ),
                    image: DecorationImage(
                      image: AssetImage('${allServicesData.image}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              defaultButton(
                function: () => navigateTo(
                    context,
                    OneService(
                      index: index,
                      title:allServicesData.title ,
                    )),
                context: context,
                text: "Show All",
                radius: 8.0,
                background: defaultColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
