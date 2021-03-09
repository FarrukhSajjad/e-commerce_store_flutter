import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopify/screens/cart.dart';
import 'package:shopify/screens/categories.dart';
import 'package:shopify/screens/favorites.dart';
import 'package:shopify/screens/home_page.dart';
import 'package:shopify/screens/more.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(55, 65, 77, 1),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlutterLogo(),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search_outlined,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.home_outlined,
                  size: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.category_outlined,
                  size: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite_border,
                  size: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 32,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.more_horiz_outlined,
                  size: 32,
                ),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              HomePage(),
              Categories(),
              Favorites(),
              Cart(),
              More(),
            ],
          ),
        ),
      ),
    );
  }
}
