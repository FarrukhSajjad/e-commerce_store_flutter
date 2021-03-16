import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DisplayProduct extends StatefulWidget {
  final String productId;
  DisplayProduct({this.productId});

  @override
  _DisplayProductState createState() => _DisplayProductState();
}

class _DisplayProductState extends State<DisplayProduct> {
  Future getProduct() async {
    var client = http.Client();
    var productModal;
    var url = "";
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonBody = response.body;
      var jsonMap = jsonDecode(jsonBody);
      print(jsonMap);
      // productModal = Products.fromJson(jsonMap);
      // print(jsonMap);
    }
    // return productModal;
  }

  @override
  void initState() {
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
