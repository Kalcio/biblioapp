import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = openDatabase(
    join(await getDatabasesPath(), 'books_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE books(id INTEGER PRIMARY KEY, name TEXT, autor TEXT, editorial TEXT, year INT, isbn INT, image TEXT)',
      );
    },
    version: 1,
  );
}
