//Database helper file

import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final userTable = 'userTable'; //database table name

class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  Database _database;

// this method returns if there is an existing database, or creates one
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Student.db");

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: initDB, //create db
      onUpgrade: onUprage,
    );
    return database;
  }

  void onUprage(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {
      // in case we need to migrate some changes between different versions.
    }
  }

  void initDB(Database database, int version) async {
    await database.execute(
      "CREATE TABLE $userTable ("
      "id INTEGER PRIMARY KEY, "
      "username TEXT, "
      "token TEXT "
      ")",
    );
  }
}
