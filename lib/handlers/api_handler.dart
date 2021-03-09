import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopify/modals/collection_modals.dart';

//API KEY = 8c2b1723cbea455ca1e6b31570a13e21;

class APIHandler {
  Future<Welcome> getCollections() async {
    var collectionsModel;
    var client = http.Client();
    var url =
        "https://4111c8422f78922a732caa88f4f25397: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@magicalyyy.myshopify.com/admin/api/2021-01/custom_collections.json";
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
