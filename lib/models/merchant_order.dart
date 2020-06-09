import 'package:meta/meta.dart';

class MerchantOrder {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String clientName;
  final String clientAddress;

  MerchantOrder({
    @required this.productName,
    @required this.productDescription,
    @required this.productPrice,
    @required this.clientName,
    @required this.clientAddress,
  });
}
