import 'package:ammar/data/db.dart';
import 'package:ammar/data/user_provider.dart';
import 'package:ammar/models/user.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  UserProvider _userProvider;

  AuthProvider() {
    _userProvider = UserProvider();
    LocalStorage();
  }

  User _user;

  User get user => _user;

  Future<User> login(String email, String password) async {
    _user = await _userProvider.getUser(email, password);
    notifyListeners();
    return _user;
  }

  Future<User> registerUser(
    String name,
    String email,
    String password,
    String type,
  ) async {
    _user = await _userProvider.insertUser(User(
      name: name,
      email: email,
      password: password,
      type: type,
    ));
    notifyListeners();
    return _user;
  }
}
