import 'package:biblioapp/model/book_model.dart';
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

  // Define a function that inserts books into the database
  Future<void> insertBook(Book book) async {
    final db = await database;

    await db.insert(
      'books',
      book.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Show all books
  Future<List<Book>> books() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('books');

    return List.generate(maps.length, (i) {
      return Book(
        id: maps[i]['id'],
        name: maps[i]['name'],
        autor: maps[i]['autor'],
        editorial: maps[i]['editorial'],
        year: maps[i]['year'],
        isbn: maps[i]['isbn'],
        image: maps[i]['image'],
      );
    });
  }

  // Update a Book
  Future<void> updateBook(Book book) async {
    final db = await database;
    await db.update(
      'books',
      book.toMap(),
      where: 'id = ?',
      whereArgs: [book.id],
    );
  }

  // Delete Book
  Future<void> deleteBook(int id) async {
    final db = await database;

    await db.delete(
      'books',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
