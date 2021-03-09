import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 50.0,
          ),
          SizedBox(
            height: 20,
          ),
          Text('There are no items currently in your cart.'),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            child: Card(
              elevation: 2,
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: Text(
                    'Continue Shopping',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
