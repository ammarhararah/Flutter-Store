import 'package:meta/meta.dart';

class User {
  int id;
  final String name;
  final String email;
  final String password;
  final String type;

  User({
    this.id,
    @required this.name,
    @required this.email,
    @required this.password,
    @required this.type,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      type: map['type'],
    );
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'email': email,
      'password': password,
      'type': type,
    };
    return map;
  }
}
