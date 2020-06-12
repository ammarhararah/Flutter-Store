import 'dart:convert';

import 'package:ammar/models/product.dart';
import 'package:ammar/pages/client/product_details_page.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  final Product product;

  const ProductWidget({Key key, @required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => ProductDetailsPage(product: product)));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(
                base64Decode(product.image),
                height: 140,
              ),
            ),
            SizedBox(height: 8),
            Text('\$${product.price}'),
            SizedBox(height: 8),
            Text(product.name),
          ],
        ),
      ),
    );
  }
}
