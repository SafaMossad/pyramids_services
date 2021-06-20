import 'package:pyramidsservices/shared/components/widgets/language_item.dart';

import '../provider/languages.dart';
import '../shared/components/widgets/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

class LanguagesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final languagesData = Provider.of<Languages>(context);
    final languages = languagesData.items;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text(
          "All Languages",
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
                  value: languages[index],
                  child: LanguagesItem(index :index ),
                ),
                itemCount: languages.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
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
