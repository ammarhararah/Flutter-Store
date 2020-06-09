import 'package:ammar/models/merchant_order.dart';
import 'package:ammar/widgets/button.dart';
import 'package:flutter/material.dart';

class OrderDetailsPage extends StatelessWidget {
  final MerchantOrder merchantOrder;

  const OrderDetailsPage({Key key, @required this.merchantOrder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Order Details',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 32),
              Text(
                'Client Name',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(merchantOrder.clientName),
              Divider(),
              SizedBox(height: 24),
              Text(
                'Address',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(merchantOrder.clientAddress),
              Divider(),
              SizedBox(height: 32),
              Button(
                onTap: () {},
                text: 'Accept',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
