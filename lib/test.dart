import 'dart:io';
import 'package:excel/excel.dart';
import 'package:ssk_resource_manager/src/features/DBProvider.dart';
import 'package:ssk_resource_manager/src/features/convert_xlsx_to_sqlite.dart';

void main() {
  ConvertXlsxToSqlite db = ConvertXlsxToSqlite();
  db.newRecord();
}
