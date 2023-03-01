import 'dart:io';
import 'package:excel/excel.dart';
import 'package:ssk_resource_manager/src/features/DBProvider.dart';

void main() {
  ExcelDecode.display();
}

class ExcelDecode {
  static void display() {
    var bytes = File('assets/test_1.xlsx').readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);
    DBProvider.db.initDB();
    var tmp = excel.tables['Computers']?.rows.asMap();
    var tmpList = tmp![excel.tables['Computers']?.rows.length];
    print(tmpList?.first);
    //tmpList?.forEach(element) {
    //Record.fromMap(element);
    // DBProvider.db.newRecord(element);
  }
}

/*
    Логика сохранения в бд

     var tmp = excel.tables['Computers']?.rows.asMap();
    var tmpList = tmp![40];
    tmpList?.forEach((element) {
      print(element?.value);
    });

     */

// class ExcelDecode {
//   //static final jsonMainData = ();
//   static void display() {
//     var bytes = File('assets/test_1.xlsx').readAsBytesSync();
//     var excel = Excel.decodeBytes(bytes);
//     bool z;
//     bool b;
//
//     for (var table in excel.tables.keys) {
//       print(table);
//       print(excel.tables[table]?.maxCols);
//       print(excel.tables[table]?.maxRows);
//       z = excel.tables[table]!.rows==null b = false : b = true;
//     if (b = true) {
//     for (var row in excel.tables[table].rows) {
//     print("$row");
//     }
//     }
//   }
//   }
// }
