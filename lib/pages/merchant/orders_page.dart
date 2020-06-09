import 'package:ammar/models/merchant_order.dart';
import 'package:ammar/widgets/merchant/order_widget.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Orders',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(32),
        itemCount: 10,
        separatorBuilder: (_, __) {
          return SizedBox(height: 16);
        },
        itemBuilder: (context, index) {
          return OrderWidget(
            merchantOrder: MerchantOrder(
              productName: 'Woman T-Shirt',
              productPrice: 29.99,
              productDescription: 'Lotto.LTD',
              clientName: 'Client Name',
              clientAddress: 'City',
            ),
          );
        },
      ),
    );
  }
}
