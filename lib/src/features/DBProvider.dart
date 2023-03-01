import 'dart:core';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'Record.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();

  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) return _database;

    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    List<String> tmp = [documentsDirectory.path, "TestDB.db"];
    String path = tmp.join();
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Record ("
          "id INTEGER PRIMARY KEY,"
          "model TEXT,"
          "buhName TEXT,"
          "serialNumber TEXT,"
          "productNumber TEXT,"
          "buhNumber TEXT,"
          "invNumber TEXT,"
          "userName TEXT,"
          "storage TEXT,"
          "sealNumber TEXT,"
          "cleanDate TEXT,"
          "comment TEXT,"
          ")");
    });
  }

  newRecord(Record newRecord) async {
    final db = await database;
    var res = await db?.rawInsert(
        "INSERT Into Record (id,model,buhName,serialNumber,productNumber,buhNumber,invNumber,userName,storage,sealNumber,cleanDate,comment)"
        " VALUES (${newRecord.id},${newRecord.model},${newRecord.buhName},${newRecord.serialNumber},${newRecord.productNumber},${newRecord.buhNumber},${newRecord.invNumber},${newRecord.userName},${newRecord.storage},${newRecord.sealNumber},${newRecord.cleanDate},${newRecord.comment})");
    return res;
  }

  getRecord(int id) async {
    final db = await database;
    var res = await db!.query("Record", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Record.fromMap(res.first) : Null;
  }

  updateRecord(Record newRecord) async {
    final db = await database;
    var res = await db?.update("Record", newRecord.toMap(),
        where: "id = ?", whereArgs: [newRecord.id]);
    return res;
  }

  deleteRecord(int id) async {
    final db = await database;
    db?.delete("Record", where: "id = ?", whereArgs: [id]);
  }
}
