import 'dart:io';

import 'package:dukka_challenge/model/employee_data.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    var dir = await getApplicationDocumentsDirectory();
    var path = dir.path;
    var databasePath = await getDatabasesPath();
    String newPath = join(databasePath, 'dukka.db');
    if (await Directory(dirname(path)).exists()) {
    } else {
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (e) {
        print(e);
      }
    }
    return await openDatabase(newPath, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE employees (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        fullName TEXT,
        phoneNumber TEXT, 
        email TEXT,
        position TEXT,
        salary TEXT
        )
        ''');
    }, version: 1);
  }

  ///Create
  Future<int> newEmployee(EmployeeData data) async {
    final db = await database;
    var res = await db!.insert('employees', data.toJson()!,
        conflictAlgorithm: ConflictAlgorithm.replace);

    return res;
  }

  ///Get all from table
  Future<List<EmployeeData>> getEmployees() async {
    final db = await database;
    final res = await db!.query('employees');
    if (res.isEmpty) {
      return [];
    } else {
      return res.map((e) => EmployeeData.fromJson(e)).toList();
    }
  }

  ///delete book
  Future<void> deleteContentById(int? id) async {
    final db = await database;
    await db!.delete('employees', where: 'id = ?', whereArgs: [id]);
  }

  // Future<void> deleteContents() async {
  //   final db = await database;
  //   var res = await db.delete('contents');
  //   return res;
  // }
}
