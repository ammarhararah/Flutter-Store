import 'package:ammar/models/cart_item.dart';
import 'package:flutter/material.dart';

class ClientProvider with ChangeNotifier {
  List<CartItem> _cart = [];
  List<CartItem> _orders = [];

  int addressId;

  List<CartItem> get cart => _cart;

  List<CartItem> get orders => _orders;

  void addToCart(CartItem cartItem) {
    _cart.add(cartItem);
    notifyListeners();
  }

  void addToOrders() {
    _orders.addAll(_cart);
    _cart = [];
    notifyListeners();
  }

  Future<void> editItemQuantity({int productId, int quantity}) async {
    _cart.forEach((item) {
      if (item.product.id == productId) {
        item.quantity = quantity;
      }
    });
    notifyListeners();
  }

  Future<void> deleteCartItem({int productId}) async {
    _cart.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }
}
