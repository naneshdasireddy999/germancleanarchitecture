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
     adviceId INTEGER NOT NULL,
      advice TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
)
''');
  }

  static Future<sql.Database> db() async {
    //actually this method is called to create  table called items which is method above
    //here only we will open database which existed already if it not existed yet we will create new databse
    //when we call this method first time only it will create new table
    //if we call this method second time it will not create new table
    return sql.openDatabase('myadvice.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createtables(database);
    });
  }

  static Future<List<Map<String, dynamic>>> getadvices() async {
    //this method is called to retrieve data which we cache inside sqflite database
    final db = await SqlHelper.db();
    return db.query('advice', orderBy: 'id');
  }

  static Future<List<Map<String, dynamic>>> getoneadvice(int id) async {
    //this method is called to retrieve only one entry from table which we cache inside sqflite database
    //we will search one entry based on id
    final db = await SqlHelper.db();
    return db.query('advice', orderBy: 'id', whereArgs: [id], limit: 1);
  }

  static Future<int> createadvice(AdviceModel advicetocache) async {
    //this method is called to insert data into tables
    final db = await SqlHelper.db();
    final data = {
      'adviceId': advicetocache.adviceId,
      'advice': advicetocache.myadvice
    };
    final id = await db.insert('advice', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<int> updateadvice(int id, String advice) async {
    //this method is called to update existing data in the table based on id
    final db = await SqlHelper.db();
    final data = {
      'id': id,
      'title': advice,
      'createdAt': DateTime.now().toString()
    };
    final result =
        await db.update('advice', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  static Future<void> deleteadvice(int id) async {
    //this method is called to delete an entry in database based on id
    final db = await SqlHelper.db();

    try {
      await db.delete('advice', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e);
    }
  }
}

class AdviceLocalDataSourceImpl implements AdviceLocalDataSource {
  AdviceLocalDataSourceImpl();
  @override
  Future<void> cacheadvice(AdviceModel adviceToCache) async {
    await SqlHelper.createadvice(adviceToCache);
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
