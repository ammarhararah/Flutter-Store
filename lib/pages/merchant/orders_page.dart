import 'package:ammar/state/merchant_provider.dart';
import 'package:ammar/widgets/merchant/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<MerchantProvider>(builder: (context, provider, child) {
        if (provider.orders.isEmpty)
          return Center(
            child: Text('No Orders Yet!'),
          );
        return ListView.separated(
          padding: const EdgeInsets.all(32),
          itemCount: provider.orders.length,
          separatorBuilder: (_, __) {
            return SizedBox(height: 16);
          },
          itemBuilder: (context, index) {
            return OrderWidget(
              merchantOrder: provider.orders[index],
            );
          },
        );
      }),
    );
  }
}
