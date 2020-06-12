import 'dart:convert';

import 'package:ammar/models/cart_item.dart';
import 'package:ammar/pages/client/cart_page.dart';
import 'package:ammar/state/client_provider.dart';
import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientOrderWidget extends StatefulWidget {
  final CartItem cartItem;

  const ClientOrderWidget({Key key, @required this.cartItem}) : super(key: key);

  @override
  _ClientOrderWidgetState createState() => _ClientOrderWidgetState();
}

class _ClientOrderWidgetState extends State<ClientOrderWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.memory(
                base64Decode(widget.cartItem.product.image),
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(widget.cartItem.product.name),
                Text(
                  widget.cartItem.product.description,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  '\$${widget.cartItem.product.price}',
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(height: 8),
                Button(
                  onTap: () {
                    Provider.of<ClientProvider>(context, listen: false)
                        .cart
                        .add(widget.cartItem);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => CartPage()));
                  },
                  text: 'Order Again',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
