// Database library
import 'package:login/database/student_database.dart';
import 'package:login/models/student_model.dart';

class StudentDao {
  final dbProvider = DatabaseProvider.dbProvider;

  // create user in the database
  Future<int> createUser(Student user) async {
    // calling the DB provider class
    final db = await dbProvider.database;

    // get data(values) from user_model.dart/User/toDatabaseJson
    // and insert into table userTable
    var result = db.insert(userTable, user.toDatabaseJson());
    return result;
  }

  // deletes a user from the database
  Future<int> deleteUser(int id) async {
    final db = await dbProvider.database;

    var result = db.delete(userTable, where: 'id = ?', whereArgs: [id]);
    return result;
  }

  // returns true if user with given id exists
  Future<bool> checkUser(int id) async {
    final db = await dbProvider.database;

    try {
      List<Map> users =
          await db.query(userTable, where: 'id = ?', whereArgs: [id]);
      if (users.length > 0) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      return false;
    }
  }
}
