import 'package:ammar/models/merchant_order.dart';
import 'package:ammar/pages/merchant/order_details_page.dart';
import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  final MerchantOrder merchantOrder;

  const OrderWidget({Key key, @required this.merchantOrder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(merchantOrder.productName),
            Text(
              merchantOrder.productDescription,
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '\$${merchantOrder.productPrice}',
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 16),
            Text(merchantOrder.clientName),
            Text(merchantOrder.clientAddress),
            SizedBox(height: 16),
            Button(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) =>
                        OrderDetailsPage(merchantOrder: merchantOrder)));
              },
              text: 'Details',
            ),
          ],
        ),
      ),
    );
  }
}
