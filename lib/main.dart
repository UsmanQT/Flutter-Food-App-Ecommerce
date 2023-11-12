import 'package:flutter/material.dart';
import 'package:food_app/screens/all_recipes.dart';
import 'package:food_app/screens/detail_cuisines.dart';
import 'package:food_app/screens/detail_recipe.dart';
import 'package:food_app/screens/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Verdana',
          primaryColor: Color(0xFFd9f6fc),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
