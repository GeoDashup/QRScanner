import 'dart:io';

import "package:path/path.dart";
import 'package:sqflite/sqflite.dart';
import "package:path_provider/path_provider.dart";

import 'package:qrscanner/src/models/scan_model.dart'; 
export 'package:qrscanner/src/models/scan_model.dart'; 

class DBProvider {

  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {

    if (database != null) return database;

    Future<Database> _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, "ScansDB.db");

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Scans ("
          "id INTEGER PRIMARY KEY,"
          "tipo TEXT"
          "valor TEXT"
          ")");
    });
  }

  // Crear registros

  //Forma que deberiamos saber
  nuevoScanRaw(ScanModel nuevoScan) async {

    final db = await database;

    final res = await db.rawInsert("INSERT Into Scans (id, tipo, valor) "
        "VALUES ( ${nuevoScan.id}, '${nuevoScan.tipo}', '${nuevoScan.valor}' )");

    return res;
  }

  //Forma que vamos a utilizar

  nuevoScan(ScanModel nuevoScan) async {

    final db = await database;

    final res = await db.insert("Scans", nuevoScan.toJson());

    return res;
  }

  // SELECT _ POBtener información

  Future<ScanModel> getScanId(int id) async {
    final db = await database;

    final res = await db.query("Scans", where: "id = ?", whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getTodosScan() async {
    final db = await database;

    final res = await db.query("Scans");

    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];

    return list;
  }

  Future<List<ScanModel>> getScansPorTipo(String tipo) async {
    final db = await database;

    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo= '$tipo'");

    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];

    return list;
  }

  //Actualizar registros

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;

    final res = db.update("Scans", nuevoScan.toJson(),
        where: "id = ?", whereArgs: [nuevoScan.id]);

    return res;
  }

  //Borrar registros

  Future<int> deleteScan(int id) async {
    final db = await database;

    final res = await db.delete(" Scans", where: "id = ?", whereArgs: [id]);

    return res;
  }

  Future<int> deleteAll() async {
    final db = await database;

    final res = await db.rawDelete("DELETE * FROM Scans");

    return res;
  }
}
