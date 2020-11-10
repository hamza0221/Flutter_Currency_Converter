import 'dart:async';
import 'dart:io';
import 'package:Mintin_techTest/models/Conversition_record.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }
  

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "HistoryDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE History ("
          "id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
          "from TEXT,"
          "to TEXT,"
          "amount TEXT,"
          "result TEXT,"
          "date TEXT"
          ")");
    });
  }

  newConversionRecord(ConversionRecord newRecord) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM History");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into History (id,from,to,amount,result,date)"
        " VALUES (?,?,?,?,?,?)",
        [id, newRecord.from, newRecord.to, newRecord.result,newRecord.date]);
    return raw;
  }



  updateConversionRecord(ConversionRecord conversionRecord) async {
    final db = await database;
    var res = await db.update("History", conversionRecord.toMap(),
        where: "id = ?", whereArgs: [conversionRecord.id]);
    return res;
  }

  getConversionRecord(int id) async {
    final db = await database;
    var res = await db.query("History", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ConversionRecord.fromMap(res.first) : null;
  }



  Future<List<ConversionRecord>> getAllConversionRecord() async {
    final db = await database;
    var res = await db.query("History");
    List<ConversionRecord> list =
        res.isNotEmpty ? res.map((c) => ConversionRecord.fromMap(c)).toList() : [];
    return list;
  }

  deleteConversionRecord(int id) async {
    final db = await database;
    return db.delete("History", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from History");
  }
}