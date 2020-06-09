import 'package:ammar/models/cart_item.dart';
import 'package:flutter/material.dart';

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
            Placeholder(
              fallbackHeight: 100,
              fallbackWidth: 100,
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
                        onTap: () {},
                        child: Icon(Icons.remove),
                      ),
                      SizedBox(width: 8),
                      Text('${widget.cartItem.quantity}'),
                      SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            GestureDetector(
              onTap: () {},
              child: Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }
}
