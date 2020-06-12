import 'package:ammar/pages/client/my_orders_page.dart';
import 'package:ammar/state/client_provider.dart';
import 'package:ammar/widgets/button.dart';
import 'package:ammar/widgets/client/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<ClientProvider>(builder: (context, provider, child) {
        if (provider.cart.isEmpty) {
          return Center(child: Text('No items to show!'));
        }
        return Stack(
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
                          cartItem: provider.cart[index],
                        );
                      },
                      separatorBuilder: (_, __) {
                        return SizedBox(height: 16);
                      },
                      itemCount: provider.cart.length,
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
                onTap: () {
                  Provider.of<ClientProvider>(context, listen: false)
                      .addToOrders();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => MyOrdersPage()));
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
