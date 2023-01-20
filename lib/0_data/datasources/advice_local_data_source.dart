import 'package:dfg/0_data/exception/exceptions.dart';
import 'package:dfg/0_data/models/advice_model.dart';
import 'package:sqflite/sqflite.dart' as sql;

abstract class AdviceLocalDataSource {
  Future<AdviceModel> getLastadvice();

  Future<void> cacheadvice(AdviceModel adviceToCache);
}

class SqlHelper {
  static Future<void> createtables(sql.Database database) async {
    await database.execute('''CREATE TABLE advice(
     id  INTEGER PRIMARY KEY NOT NULL,
     adviceId INTEGER,
      advice TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)
''');
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('myadvice.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createtables(database);
    });
  }
}

class AdviceLocalDataSourceImpl implements AdviceLocalDataSource {
  AdviceLocalDataSourceImpl();
  @override
  Future<void> cacheadvice(AdviceModel adviceToCache) async {
    var db = await SqlHelper.db();
    final data = {'advice': adviceToCache.myadvice};
    await db.insert('advice', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  @override
  Future<AdviceModel> getLastadvice() async {
    var db = await SqlHelper.db();
    // await db.delete('advice');
    final List<Map<String, dynamic>> maps = await db.query('advice');

    if (maps.isNotEmpty) {
      return AdviceModel.fromJson(maps.last);
    } else {
      throw CacheException();
    }
  }
}
