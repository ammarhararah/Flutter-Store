import 'package:ammar/data/db.dart';
import 'package:ammar/data/merchant_data/orders_provider.dart';
import 'package:ammar/data/merchant_data/products_provider.dart';
import 'package:ammar/models/merchant_order.dart';
import 'package:ammar/models/product.dart';
import 'package:flutter/material.dart';

class MerchantProvider extends ChangeNotifier {
  ProductsProvider _productsProvider;
  OrdersProvider _ordersProvider;

  MerchantProvider() {
    _productsProvider = ProductsProvider();
    _ordersProvider = OrdersProvider();
    LocalStorage();
  }

  List<Product> _products = [];
  List<MerchantOrder> _orders = [];

  List<Product> get products => _products;

  List<MerchantOrder> get orders => _orders;

  Future<void> getAllProducts() async {
    _products = await _productsProvider.getProducts();
    notifyListeners();
  }

  Future<void> newProduct(Product product) async {
    await _productsProvider.insertProduct(product);
    _products = await _productsProvider.getProducts();
    notifyListeners();
  }

  Future<void> getMerchantOrders(int merchantId) async {
    _orders = await _ordersProvider.getOrdersForMerchant(merchantId);
    notifyListeners();
  }
}
