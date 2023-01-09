import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConnection {
  static const String dbName = "todo.sqlite";
  static Future<Database> dbConnection() async {
    String dbPath = join(await getDatabasesPath(), dbName);
    if (await databaseExists(dbPath)) {
      print("Database already exists.");
    } else {
      ByteData data = await rootBundle.load("database/$dbName");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await File(dbPath).writeAsBytes(bytes, flush: true);
      print("Database copied.");
    }
    return openDatabase(dbPath);
  }
}
