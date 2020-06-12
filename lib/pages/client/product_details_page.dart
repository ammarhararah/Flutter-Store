import 'dart:convert';

import 'package:ammar/models/cart_item.dart';
import 'package:ammar/models/product.dart';
import 'package:ammar/pages/client/cart_page.dart';
import 'package:ammar/state/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.memory(
                  base64Decode(product.image),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                product.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '\$${product.price}',
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(product.description),
            ],
          ),
        ),
      ),
      bottomNavigationBar: FlatButton(
        onPressed: () {
          Provider.of<ClientProvider>(context, listen: false).cart.add(CartItem(
                quantity: 1,
                product: product,
              ));
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => CartPage()));
        },
        color: Colors.blue,
        child: Text(
          'BUY NOW',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
