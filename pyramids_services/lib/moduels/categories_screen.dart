import 'package:pyramidsservices/provider/auth.dart';
import 'package:pyramidsservices/shared/components/widgets/language_item.dart';

import '../models/category_model.dart';
import 'login_screen.dart';
import '../provider/categories.dart';
import '../shared/components/components.dart';
import '../shared/components/widgets/category_item.dart';
import '../shared/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CategoriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final categoriesData = Provider.of<Categories>(context);
    final categories = categoriesData.items;
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: size.height / 3,
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: defaultButton(
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                  Provider.of<Auth>(context, listen: false).logout();
                },
                context: context,
                //width: 60.0,
                text: "Log Out",
                radius: 8.0,
                fontSize: 15.0,
                background: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "All Categories",
          style: Theme.of(context).textTheme.headline6.copyWith(
            color: Colors.black
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              GridView.builder(
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                  value: categories[index],
                  child: CategoryItem(index :index ),
                ),
                itemCount: categories.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.15,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 15.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
