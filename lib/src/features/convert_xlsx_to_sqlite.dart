import 'dart:html';

import 'package:ssk_resource_manager/src/features/Record.dart';
import 'package:excel/excel.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class ConvertXlsxToSqlite {
  final String databasePath =
      "C:\Users\KokorinaAA\Documents\test_proj\ssk_resource_manager\assets\database\sqfile.db";
  final file = "assets\test_1.xlsx";

  void xlsxToSqlite(String dbPath, String excelPath, String tableName) async {
    var bytes = File(excelPath).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    var tmp = excel.tables[tableName]?.rows
        .asMap(); //Сама таблица Map (int, List<Data>)
    List<Record> recordList = [];

    for (var i = 2; i < excel.tables[tableName]!.maxRows; i++) {
      Record tmpRecord = Record();

      tmpRecord.id = tmp![i]?[0]?.value ?? "Missing data";
      tmpRecord.model = tmp[i]?[1]?.value.toString() ?? "Missing data";
      tmpRecord.buhName = tmp[i]?[2]?.value.toString() ?? "Missing data";
      tmpRecord.serialNumber = tmp[i]?[3]?.value.toString() ?? "Missing data";
      tmpRecord.productNumber = tmp[i]?[4]?.value.toString() ?? "Missing data";
      tmpRecord.buhNumber = tmp[i]?[5]?.value.toString() ?? "Missing data";
      tmpRecord.invNumber = tmp[i]?[6]?.value.toString() ?? "Missing data";
      tmpRecord.userName = tmp[i]?[7]?.value.toString() ?? "Missing data";
      tmpRecord.storage = tmp[i]?[8]?.value.toString() ?? "Missing data";
      tmpRecord.status = tmp[i]?[8]?.value.toString() ?? "Missing data";
      tmpRecord.sealNumber = tmp[i]?[10]?.value.toString() ?? "Missing data";
      tmpRecord.cleanDate = tmp[i]?[11]?.value.toString() ?? "Missing data";
      tmpRecord.comment = tmp[i]?[12]?.value.toString() ?? "Missing data";

      recordList.add(tmpRecord);
    }
  }

  void createTable(
      List<Record> recordList, String dbPath, String sqlQuery) async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(dbPath);

    /*await db.execute('''
      create table if not exist "Computers"(
        "id" INTEGER PRIMARY KEY,
        "model" TEXT,
        "buhName" TEXT,
        "serialNumber" TEXT,
        "productNumber" TEXT,
        "buhNumber" TEXT,
        "invNumber" TEXT,
        "userName" TEXT,
        "storage" TEXT,
        "status" TEXT,
        "sealNumber" TEXT,
        "cleanDate" TEXT,
        "comment" TEXT
    )''');*/

    await db.execute(sqlQuery);

    for (var i = 0; i < recordList.length; i++) {
      db.insert("Computers", {
        'model': '${recordList[i].model}',
        'buhName': '${recordList[i].buhName}',
        'serialNumber': '${recordList[i].serialNumber}',
        'productNumber': '${recordList[i].productNumber}',
        'buhNumber': '${recordList[i].buhNumber}',
        'invNumber': '${recordList[i].invNumber}',
        'userName': '${recordList[i].userName}',
        'storage': '${recordList[i].storage}',
        'status': '${recordList[i].status}',
        'sealNumber': '${recordList[i].sealNumber}',
        'cleanDate': '${recordList[i].cleanDate}',
        'comment': '${recordList[i].comment}'
      });
    }

    db.close();
  }

  void newRecord(
      /*String dbPath, String sqlQuery,
      String tableName, Map<String, Record> listOfRecords*/
      ) async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    var db = await databaseFactory.openDatabase(databasePath);

    var list = await db.rawQuery('SELECT * FROM "Computers"');
    print(list);
    //LOGIC

    db.close();
  }
}
