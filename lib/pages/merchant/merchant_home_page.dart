import 'package:ammar/pages/merchant/new_product_page.dart';
import 'package:ammar/pages/merchant/orders_page.dart';
import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';

class MerchantHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => NewProductPage()));
              },
              text: 'New Product',
            ),
            SizedBox(height: 32),
            Button(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => OrdersPage()));
              },
              text: 'Orders',
            ),
          ],
        ),
      ),
    );
  }
}
