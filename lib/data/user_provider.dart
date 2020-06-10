import 'package:ammar/data/db.dart';
import 'package:ammar/models/user.dart';

class UserProvider {
  final String _tableUser = 'user';
  final String _columnId = 'id';
  final String _columnName = 'name';
  final String _columnEmail = 'email';
  final String _columnPassword = 'password';
  final String _columnType = 'type';

  Future<User> insertUser(User user) async {
    await LocalStorage().db.insert(_tableUser, user.toMap());
    return user;
  }

  Future<User> getUser(String email, String password) async {
    List<Map> maps = await LocalStorage().db.query(_tableUser,
        columns: [_columnId, _columnEmail, _columnName, _columnType],
        where: '$_columnEmail = ? AND $_columnPassword = ?',
        whereArgs: [email, password]);
    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }
    return null;
  }
}
