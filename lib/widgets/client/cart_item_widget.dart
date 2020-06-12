import 'dart:convert';

import 'package:ammar/models/cart_item.dart';
import 'package:ammar/state/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatefulWidget {
  final CartItem cartItem;

  const CartItemWidget({Key key, @required this.cartItem}) : super(key: key);

  @override
  _CartItemWidgetState createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
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
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.grey[200],
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          if (widget.cartItem.quantity > 1)
                            Provider.of<ClientProvider>(context, listen: false)
                                .editItemQuantity(
                                    productId: widget.cartItem.product.id,
                                    quantity: widget.cartItem.quantity - 1);
                        },
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 8),
                      Text('${widget.cartItem.quantity}'),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          Provider.of<ClientProvider>(context, listen: false)
                              .editItemQuantity(
                                  productId: widget.cartItem.product.id,
                                  quantity: widget.cartItem.quantity + 1);
                        },
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {
                Provider.of<ClientProvider>(context, listen: false)
                    .deleteCartItem(productId: widget.cartItem.product.id);
              },
              child: Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
