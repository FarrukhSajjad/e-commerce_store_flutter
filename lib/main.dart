import 'package:flutter/material.dart';
import 'package:shopify/home.dart';
import 'package:shopify/screens/products_view.dart';

void main() {
  // ShopifyConfig.setConfig(
  //   "4111c8422f78922a732caa88f4f25397",
  //   "priceinpakistanpk.com",
  //   "2021-01",
  // );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}
