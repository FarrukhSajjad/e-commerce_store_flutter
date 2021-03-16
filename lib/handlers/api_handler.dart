import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopify/modals/collection_modals.dart';

//API KEY = 8c2b1723cbea455ca1e6b31570a13e21;

class APIHandler {
  Future<Welcome> getCollections() async {
    var collectionsModel;
    var client = http.Client();
    var url = "";
    var response = await client.get(url);

    if (response.statusCode == 200) {
      var jsonBody = response.body;
      var jsonMap = jsonDecode(jsonBody);
      //print(jsonBody);
      collectionsModel = Welcome.fromJson(jsonMap);
    }

    return collectionsModel;
  }
}
