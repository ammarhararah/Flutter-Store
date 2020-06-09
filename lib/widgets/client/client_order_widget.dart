import 'package:ammar/models/cart_item.dart';
import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';

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
                Button(
                  onTap: () {},
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
