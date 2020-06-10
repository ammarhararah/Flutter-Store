import 'package:ammar/data/db.dart';
import 'package:ammar/models/product.dart';

class ProductsProvider {
  final String _tableProduct = 'product';
  final String _columnId = 'id';
  final String _columnName = 'name';
  final String _columnPrice = 'price';
  final String _columnCategory = 'category';
  final String _columnDescription = 'description';
  final String _columnImage = 'image';

  Future<Product> insertProduct(Product product) async {
    await LocalStorage().db.insert(_tableProduct, product.toMap());
    return product;
  }

  Future<List<Product>> getProducts() async {
    List<Map> maps = await LocalStorage().db.query(
      _tableProduct,
      columns: [
        _columnId,
        _columnName,
        _columnPrice,
        _columnCategory,
        _columnDescription,
        _columnImage,
      ],
    );
    if (maps.length > 0) {
      return Product.fromMapList(maps);
    }
    return null;
  }
}
