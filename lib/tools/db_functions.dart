import 'dart:ffi';
import 'dart:io';

import 'package:json2sqlite3_converter/models/hymn.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:path/path.dart' as path;
import 'package:sqlite3/open.dart';

void createAndPopulateDB(List<Hymn> hymns) {
  open.overrideFor(OperatingSystem.windows, _openOnWindows);

  final String dbPath =
      path.join(Directory.current.path, 'assets\\hymns_database.sqlite3');
  final Database db = sqlite3.open(dbPath);

  db.execute(
    """
      CREATE TABLE hymns (
        hymnNumber INTEGER NOT NULL PRIMARY KEY,
        hymnName TEXT NOT NULL,
        hymnLyrics TEXT NOT NULL,
        category TEXT NOT NULL
      )""",
  );

  PreparedStatement insertStmt = db.prepare("""
      INSERT INTO hymns (hymnNumber, hymnName, hymnLyrics, category) 
      VALUES (?, ?, ?, ?)
      """);
  for (Hymn hymn in hymns) {
    insertStmt.execute([
      hymn.hymnNumber,
      hymn.hymnName,
      hymn.hymnLyrics,
      hymn.category,
    ]);
  }
  insertStmt.dispose();

  final ResultSet results = db.select('SELECT * FROM hymns');
  for (var row in results) {
    print(row['hymnNumber']);
  }
  print('Length is ${results.length}');

  db.dispose();
}

DynamicLibrary _openOnWindows() {
  final String sqlite3Path =
      path.join(Directory.current.path, 'assets\\sqlite3.dll');
  print(sqlite3Path);
  final libraryNextToScript = File(sqlite3Path);
  return DynamicLibrary.open(libraryNextToScript.path);
}
