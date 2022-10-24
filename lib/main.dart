import 'package:flutter/material.dart';
import 'package:shoppingn_app_with_getx/shopping_app/view/home_page.dart';
import 'package:shoppingn_app_with_getx/shopping_app/view/product_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:HomePage(),
    );
  }
}
