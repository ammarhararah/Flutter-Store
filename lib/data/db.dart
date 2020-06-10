import 'package:sqflite/sqflite.dart';

class LocalStorage {
  final String _tableProduct = 'product';
  final String _columnPrice = 'price';
  final String _columnCategory = 'category';
  final String _columnDescription = 'description';
  final String _columnImage = 'image';
  final String _columnUserId = 'user_id';

  final String _tableOrder = 'orders';
  final String _columnProductName = 'productName';
  final String _columnProductDescription = 'productDescription';
  final String _columnProductPrice = 'productPrice';
  final String _columnMerchantId = 'merchantId';
  final String _columnClientId = 'clientId';
  final String _columnClientName = 'clientName';
  final String _columnClientAddress = 'clientAddress';
  final String _columnIsAccepted = 'isAccepted';

  final String _tableUser = 'user';
  final String _columnId = 'id';
  final String _columnName = 'name';
  final String _columnEmail = 'email';
  final String _columnPassword = 'password';
  final String _columnType = 'type';

  Database db;

  Future<void> open() async {
    var databasesPath = await getDatabasesPath();
    db = await openDatabase('$databasesPath/app.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $_tableUser ( 
  $_columnId integer primary key autoincrement, 
  $_columnName text not null,
  $_columnEmail text not null,
  $_columnPassword text not null,
  $_columnType text not null);
''');
      await db.execute('''
  create table $_tableProduct (
  $_columnId integer primary key autoincrement,
  $_columnUserId integer not null, 
  $_columnName text not null,
  $_columnPrice float not null,
  $_columnCategory text not null,
  $_columnDescription text not null,
  $_columnImage text not null);
''');

      await db.execute('''
  create table $_tableOrder (
  $_columnId integer primary key autoincrement,
  $_columnProductName text not null, 
  $_columnProductDescription text not null,
  $_columnProductPrice float not null,
  $_columnMerchantId integer not null,
  $_columnClientId integer not null,
  $_columnClientName text not null,
  $_columnClientAddress text not null,
  $_columnIsAccepted integer default 0);
''');
    });
  }

  static final LocalStorage _localStorage = LocalStorage._internal();

  factory LocalStorage() {
    return _localStorage;
  }

  LocalStorage._internal() {
    open();
  }
}
