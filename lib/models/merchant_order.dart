import 'package:meta/meta.dart';

class MerchantOrder {
  int id;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int merchantId;
  final int clientId;
  final String clientName;
  final String clientAddress;
  int isAccepted;

  MerchantOrder({
    this.id,
    @required this.productName,
    @required this.productDescription,
    @required this.productPrice,
    @required this.merchantId,
    @required this.clientId,
    @required this.clientName,
    @required this.clientAddress,
    this.isAccepted,
  });

  factory MerchantOrder.fromMap(Map<String, dynamic> map) {
    return MerchantOrder(
      id: map['id'],
      productName: map['productName'],
      productDescription: map['productDescription'],
      productPrice: map['productPrice'],
      merchantId: map['merchantId'],
      clientId: map['clientId'],
      clientName: map['clientName'],
      clientAddress: map['clientAddress'],
      isAccepted: map['isAccepted'],
    );
  }

  static List<MerchantOrder> fromMapList(List<Map<String, dynamic>> mapList) {
    List<MerchantOrder> list = [];
    mapList.forEach((element) {
      list.add(MerchantOrder.fromMap(element));
    });
    return list;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'productName': productName,
      'productDescription': productDescription,
      'productPrice': productPrice,
      'merchantId': merchantId,
      'clientId': clientId,
      'clientName': clientName,
      'clientAddress': clientAddress,
      'isAccepted': isAccepted,
    };
    return map;
  }
}
