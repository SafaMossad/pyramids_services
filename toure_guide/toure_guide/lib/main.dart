import 'package:pyramidsservices/moduels/categories_screen.dart';
import 'package:pyramidsservices/moduels/login_screen.dart';
import 'package:pyramidsservices/moduels/splash_screen.dart';
import 'package:pyramidsservices/provider/contact_tourguide.dart';
import 'package:pyramidsservices/provider/suggestion.dart';

import './provider/all_services.dart';
import './provider/auth.dart';
import './provider/languages.dart';
import './provider/one_service.dart';
import './provider/report.dart';
import './provider/review.dart';

import './provider/categories.dart';
import './provider/toure_guide.dart';
import './shared/styles/themes.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Auth()),
        ChangeNotifierProxyProvider<Auth, OneServiceProvider>(
          //  child: Tabs(),
          update: (ctx, auth, previousServices) => OneServiceProvider(
            auth.token,
            auth.userId,
            previousServices == null ? [] : previousServices.items,
          ),
        ),
        ChangeNotifierProvider(create: (ctx) => Categories()),



        ChangeNotifierProxyProvider<Auth, TourGuideProvider>(
          //  child: Tabs(),
          update: (ctx, auth, previousReviews) => TourGuideProvider(
            auth.token,
            auth.userId,
            previousReviews == null ? [] : previousReviews.items,
          ),
        ),

        ChangeNotifierProxyProvider<Auth, ReviewProvider>(
          //  child: Tabs(),
          update: (ctx, auth, previousReviews) => ReviewProvider(
            auth.token,
            auth.userId,
            previousReviews == null ? [] : previousReviews.allReviews,
          ),
        ),

        ChangeNotifierProxyProvider<Auth, SuggestionProvider>(
          //  child: Tabs(),
          update: (ctx, auth, _) => SuggestionProvider(
            auth.token,
            auth.userId,

          ),
        ),

        ChangeNotifierProxyProvider<Auth, ReportsProvider>(
          update: (ctx, auth, _) => ReportsProvider(
            auth.token,
            auth.userId,

          ),
        ),


        ChangeNotifierProvider(create: (ctx) => Languages()),
        ChangeNotifierProvider(create: (ctx) => AllServicesData()),

        ChangeNotifierProxyProvider<Auth, ContactTourGuideProvider>(
          //  child: Tabs(),
          update: (ctx, auth, previousProducts) => ContactTourGuideProvider(
            auth.token,
            auth.userId,
          ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pyramids Services',
          theme: appTheme,

          //1-  ده علشان لما اكون في صفحه اللوجين اخليه يعمل نافيجيشن لوحده
          //-1 ده علشان لما افتح بقي الابلكيشن نفسه يعمل تراي للوجين
          home: auth.isAuth
              ? CategoriesScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) =>
                      authResultSnapshot.connectionState ==
                              ConnectionState.waiting
                          ? SplashScreen()
                          : LoginScreen(),
                ),
        ),
      ),
    );
  }
}
