import 'package:flutter/material.dart';
import 'package:flutter_mini_shop/screens/BrandScreen.dart';
import 'package:flutter_mini_shop/screens/CategoryScreen.dart';
import 'package:flutter_mini_shop/screens/ProductScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // home: CategoryScreen(title: 'Category'),
      // home: BrandScreen(title: 'Brand'),
      home: ProductScreen(title: 'Product'),
    );
  }
}