import 'dart:async';
import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Model Book
class Book {
  // Variables model book
  final int id;
  final String name;
  final String autor;
  final String editorial;
  final int year;
  final int isbn;
  final String image;

  const Book({
    required this.id,
    required this.name,
    required this.autor,
    required this.editorial,
    required this.year,
    required this.isbn,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'autor': autor,
      'editorial': editorial,
      'year': year,
      'isbn': isbn,
      'image': image,
    };
  }

  @override
  String toString() {
    return 'Book{id: $id, name: $name, autor: $autor, editorial: $editorial, year: $year, isbn: $isbn, image: $image}';
  }
}
