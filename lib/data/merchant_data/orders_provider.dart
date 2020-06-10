import 'package:ammar/data/db.dart';
import 'package:ammar/models/merchant_order.dart';

class OrdersProvider {
  final String _tableOrder = 'order';
  final String _columnId = 'id';
  final String _columnProductName = 'productName';
  final String _columnProductDescription = 'productDescription';
  final String _columnProductPrice = 'productPrice';
  final String _columnMerchantId = 'merchantId';
  final String _columnClientId = 'clientId';
  final String _columnClientName = 'clientName';
  final String _columnClientAddress = 'clientAddress';
  final String _columnIsAccepted = 'isAccepted';

  Future<MerchantOrder> insertOrder(MerchantOrder order) async {
    await LocalStorage().db.insert(_tableOrder, order.toMap());
    return order;
  }

  Future<List<MerchantOrder>> getOrdersForMerchant(int merchantId) async {
    List<Map> maps = await LocalStorage().db.query(_tableOrder,
        columns: [
          _columnId,
          _columnProductName,
          _columnProductDescription,
          _columnProductPrice,
          _columnMerchantId,
          _columnClientId,
          _columnClientName,
          _columnClientAddress,
          _columnIsAccepted,
        ],
        where: '$_columnMerchantId = ?',
        whereArgs: [merchantId]);
    if (maps.length > 0) {
      return MerchantOrder.fromMapList(maps);
    }
    return null;
  }
}
