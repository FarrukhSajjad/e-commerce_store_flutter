import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shopify/constants.dart';

import 'package:http/http.dart' as http;
import 'package:shopify/modals/products.dart';
import 'package:shopify/screens/display_product.dart';

class ProductsScreen extends StatefulWidget {
  final String categoryTitle;
  final String id;
  ProductsScreen({this.categoryTitle, this.id});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  Future<Products> productsModal;

  Future<Products> getProductsByCollection() async {
    var client = http.Client();
    var productModal;
    var url = "";
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonBody = response.body;
      var jsonMap = jsonDecode(jsonBody);
      productModal = Products.fromJson(jsonMap);
      print(jsonMap);
    }
    return productModal;
  }

  @override
  void initState() {
    super.initState();
    getProductsByCollection();
    productsModal = getProductsByCollection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text(widget.categoryTitle),
        actions: [
          IconButton(icon: Icon(Icons.search_outlined), onPressed: () {}),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
          IconButton(icon: Icon(Icons.list), onPressed: () {}),
        ],
      ),
      body: FutureBuilder<Products>(
        future: productsModal,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return GridView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.53,
            ),
            itemBuilder: (BuildContext context, int index) {
              var products = snapshot.data.products[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return DisplayProduct(
                      productId: products.id.toString(),
                    );
                  }));
                },
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        image: DecorationImage(
                          image: NetworkImage(
                            products.images[0].src,
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ListTile(
                            title: Text(
                              products.title,
                              maxLines: 1,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 18.0,
                              ),
                            ),
                            subtitle: Text(
                              "Rs. ${products.variants[0].price}",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
