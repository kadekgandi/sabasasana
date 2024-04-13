// model untuk membuat database dan fungsi CRUD
import 'dart:async';

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sabasasana/dto/Place.dart';



class DatabaseHelper {
  static Future<Database> get database async {
    final String path = join(await getDatabasesPath(), 'example.db');

    return openDatabase(path, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE place(id INTEGER PRIMARY KEY, nama TEXT, kategori TEXT, body TEXT, url TEXT)',
      );
    }, version: 1);
  }

  static Future<void> insertData(Place data) async {
    final Database db = await database;
    await db.insert(
      'place',
      data.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Place>> getData() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('place');

    return List.generate(maps.length, (i) {
      return Place.fromMap(maps[i]);
    });
  }

  static Future<void> updateData(Place data) async {
    final db = await database;
    await db.update(
      'place',
      data.toMap(),
      where: 'id = ?',
      whereArgs: [data.id],
    );
  }

  static Future<void> deleteData(int id) async {
    final db = await database;
    await db.delete(
      'place',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
