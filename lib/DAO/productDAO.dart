import 'package:sqflite/sqflite.dart';

class ProductDAO {
  static const _databaseName = "database.db";
  static late Database database;

  static Future<Database> _getConnection() async {
    String databasePath = await getDatabasesPath();
    String path = "$databasePath $_databaseName";
    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
            "CREATE TABLE products (code INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,price REAL)");
      },
    );
    return database;
  }

  static Future<int> insertRecord(
      String table, Map<String, dynamic> data) async {
    database = await ProductDAO._getConnection();
    int result = await database.insert(table, data);
    return result;
  }

  static Future<List<Map<String, dynamic>>> listRecords(String table) async {
    database = await ProductDAO._getConnection();
    List<Map<String, dynamic>> data = await database.query(table);
    database.close();
    return data;
  }

  static Future<int> updateRecord(
      String table, Map<String, dynamic> data) async {
    database = await _getConnection();
    int result = await database.update(
      table,
      data,
      where: "code=?  ",
      whereArgs: [
        data["code"],
      ],
    );
    database.close();
    return result;
  }

  static Future<int> removeRecord(String table, int id) async {
    database = await _getConnection();
    int result = await database.delete(
      table,
      where: "code=?",
      whereArgs: [id],
    );
    database.close();
    return result;
  }
}
