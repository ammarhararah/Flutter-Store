import 'package:ammar/models/cart_item.dart';
import 'package:ammar/models/product.dart';
import 'package:ammar/widgets/client/client_order_widget.dart';
import 'package:flutter/material.dart';

class MyOrdersPage extends StatefulWidget {
  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'My Orders',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 32),
            Expanded(
              child: ListView.separated(
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  return ClientOrderWidget(
                    cartItem: CartItem(
                      product: Product(
                        userId: 1,
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
    );
  }
}
