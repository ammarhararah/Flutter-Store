import 'package:meta/meta.dart';

class Product {
  int id;
  final int userId;
  final String name;
  final double price;
  final String category;
  final String description;
  final dynamic image;

  Product({
    int id,
    @required this.userId,
    @required this.name,
    @required this.price,
    @required this.category,
    @required this.description,
    @required this.image,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      userId: map['user_id'],
      name: map['name'],
      price: map['price'],
      category: map['category'],
      description: map['description'],
      image: map['image'],
    );
  }

  static List<Product> fromMapList(List<Map<String, dynamic>> mapList) {
    List<Product> list = [];
    mapList.forEach((element) {
      list.add(Product.fromMap(element));
    });
    return list;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'name': name,
      'price': price,
      'user_id': userId,
      'category': category,
      'description': description,
      'image': image,
    };
    return map;
  }
}
