import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopify/handlers/api_handler.dart';
import 'package:shopify/modals/collection_modals.dart';
import 'package:shopify/screens/products_screen.dart';
import 'package:shopify/screens/products_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Welcome> collectionModal;

  @override
  void initState() {
    super.initState();
    collectionModal = APIHandler().getCollections();
  }

  List<String> sliderItems = [
    'https://cdn.shopify.com/s/files/1/0415/3432/4902/files/slider1_1296x.jpg',
    'https://cdn.shopify.com/s/files/1/0415/3432/4902/files/slider2_1296x.jpg',
    'https://cdn.shopify.com/s/files/1/0415/3432/4902/files/slider3_1296x.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 10.0,
          ),
          child: FutureBuilder<Welcome>(
            future: collectionModal,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.customCollections.length,
                    itemBuilder: (BuildContext ctx, int index) {
                      var collection = snapshot.data.customCollections[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => ProductsScreen(
                                      categoryTitle: snapshot
                                          .data.customCollections[index].title,
                                      id: snapshot
                                          .data.customCollections[index].id
                                          .toString(),
                                    )),
                          );
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.grey,
                              backgroundImage: NetworkImage(
                                collection.image.src,
                              ),
                              child: collection.image.src == null
                                  ? CircularProgressIndicator()
                                  : Text(''),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              collection.title,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    });
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
