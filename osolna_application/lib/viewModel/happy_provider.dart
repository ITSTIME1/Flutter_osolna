import 'package:flutter/cupertino.dart';
import 'package:osolna_application/memoRepository/memo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// ignore: slash_for_doc_comments
/**
 * [HappyDBHelper] This is only save that when you wrote happy memo.
 */

const String _tableName = 'happyMemo';

class HappyDBHelper extends ChangeNotifier {
  var _happyDatabase;

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase Create]
   */
  Future<Database> get happyDatabase async {
    if (_happyDatabase != null) {
      return _happyDatabase;
    }
    _happyDatabase = openDatabase(
      join(await getDatabasesPath(), 'happy.memo'),
      onCreate: (db, version) {
        return db.execute(
            "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, content TEXT, dateTime TEXT,)");
      },
      version: 1,
    );
    return _happyDatabase;
  }

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase Insert Memo]
   */
  Future<void> insertMemo(Memo memo) async {
    final hd = await happyDatabase;
    await hd.insert(
      _tableName,
      memo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase Delete Memo]
   */

  Future<void> deleteMemo(int id) async {
    final hd = await happyDatabase;

    await hd.delete(
      _tableName,
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // ignore: slash_for_doc_comments
  /**
   * [HappyDatabase getAllData]
   */

  Future<List<Memo>> getHappyMemos() async {
    final hd = await happyDatabase;
    final List<Map<String, dynamic>> happyMaps = await hd.query(_tableName);
    return List.generate(happyMaps.length, (index) {
      return Memo(
        id: happyMaps[index]['id'],
        title: happyMaps[index]['title'],
        content: happyMaps[index]['title'],
        dateTime: happyMaps[index]['dateTime'],
      );
    });
  }
}
