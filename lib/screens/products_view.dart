import 'package:flutter/material.dart';
import 'package:shopify/constants.dart';

class ProductView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Product Category'),
        actions: [
          IconButton(icon: Icon(Icons.search_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: Icon(Icons.list), onPressed: () {}),
        ],
      ),
    );
  }
}
