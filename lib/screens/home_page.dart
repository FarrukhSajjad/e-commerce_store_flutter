import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopify/handlers/api_handler.dart';
import 'package:shopify/modals/collection_modals.dart';
import 'package:shopify/screens/products_screen.dart';

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
          child: FutureBuilder<Welcome>(
            future: collectionModal,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Container(
                      child: CarouselSlider.builder(
                        itemCount: sliderItems.length,
                        itemBuilder: (context, int index, ind) {
                          return Container(
                            margin: EdgeInsets.all(6.0),
                            height: 220,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(sliderItems[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          height: 200.0,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 800),
                          viewportFraction: 2,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                            ),
                            itemCount: snapshot.data.customCollections.length,
                            itemBuilder: (BuildContext ctx, int index) {
                              var collection =
                                  snapshot.data.customCollections[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => ProductsScreen(
                                              categoryTitle: collection.title,
                                              id: collection.id.toString(),
                                            )),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Flexible(
                                        child: CircleAvatar(
                                          radius: 50.0,
                                          backgroundColor: Colors.grey,
                                          backgroundImage: NetworkImage(
                                            collection.image.src,
                                          ),
                                          child: collection.image.src == null
                                              ? CircularProgressIndicator()
                                              : Text(''),
                                        ),
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
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                );
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
