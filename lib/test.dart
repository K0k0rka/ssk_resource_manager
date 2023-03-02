import 'dart:io';
import 'package:excel/excel.dart';
import 'package:ssk_resource_manager/src/features/DBProvider.dart';
import 'package:ssk_resource_manager/src/features/convert_xlsx_to_sqlite.dart';

void main() {
  var converter = ConvertXlsxToSqlite(tmp: 1, _tmp2: 3);

  print("tmp: ${converter.tmp}; tmp2: ${converter._tmp2}");
}
