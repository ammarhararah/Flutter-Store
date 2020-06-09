import 'package:meta/meta.dart';

class Product {
  final String name;
  final double price;
  final String category;
  final String description;
  final dynamic image;

  Product({
    @required this.name,
    @required this.price,
    @required this.category,
    @required this.description,
    @required this.image,
  });
}
