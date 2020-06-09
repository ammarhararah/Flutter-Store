import 'package:ammar/models/cart_item.dart';
import 'package:ammar/models/product.dart';
import 'package:ammar/widgets/button.dart';
import 'package:ammar/widgets/client/cart_item_widget.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Cart',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 32),
                Expanded(
                  child: ListView.separated(
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CartItemWidget(
                        cartItem: CartItem(
                          product: Product(
                            name: 'Woman T-Shirt',
                            price: 29.99,
                            description: 'asdasdf',
                            category: 'Women',
                            image: null,
                          ),
                          quantity: 1,
                        ),
                      );
                    },
                    separatorBuilder: (_, __) {
                      return SizedBox(height: 16);
                    },
                    itemCount: 20,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 32,
            right: 32,
            bottom: 16,
            child: Button(
              text: 'Continue',
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
