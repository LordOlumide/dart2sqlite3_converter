import 'package:json2sqlite3_converter/models/hymn.dart';
import 'package:json2sqlite3_converter/tools/db_functions.dart';
import 'package:json2sqlite3_converter/tools/json_decoder.dart';

void convertJsonHymnsToSqliteDB() async {
  List<Map<String, dynamic>> hymns = await JsonHandler.decodeHymns();

  List<Hymn> allHymns =
      hymns.map((hymnData) => Hymn.fromMap(hymnData)).toList();

  createAndPopulateDB(allHymns);
}
