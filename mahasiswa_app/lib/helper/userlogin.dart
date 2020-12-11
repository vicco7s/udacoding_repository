import 'package:flutter/cupertino.dart';
import 'package:mahasiswa_app/model/loginmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DatabaseHelperLogin {

  static final DatabaseHelperLogin _instanse = new DatabaseHelperLogin.internal();
  factory DatabaseHelperLogin() => _instanse;

  final String tabelName = 'users';
  final String columnID = 'id';
  final String columnEmail = 'email';
  final String columnUsername = 'username';
  final String columnPassword = 'password';

  static Database _db;

  DatabaseHelperLogin.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'users.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    db.execute('CREATE TABLE $tabelName($columnID INTEGER PRIMARY KEY, $columnEmail TEXT, $columnUsername TEXT, $columnPassword TEXT)');
  }

  //Create data user
  Future<int> createUser(Admin admin) async{
    var dbClient = await db;
    var result = await dbClient.insert(tabelName, admin.toMap());
    return result;
  }

  //Get all data user
  Future<List> getAllUsers() async{
    var dbClient = await db;
    var result = await dbClient.query(tabelName, columns: [columnID, columnEmail, columnUsername, columnPassword]);
    return result;
  }

  //Get one data user
  Future<Admin> getUser({@required String username, @required String password}) async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tabelName WHERE $columnUsername = ? AND $columnPassword = ?", [username, password]);
    if(result.length>0){
      return Admin.fromMap(result.first);
    }
    return null;
  }

  //Update data user
  Future<int> updateUser(Admin admin) async{
    var dbClient = await db;
    return await dbClient.update(tabelName, admin.toMap(), where: "$columnID=?", whereArgs: [admin.id]);
  }

  //Delete data user
  Future<int> deleteUser(int id) async{
    var dbClient = await db;
    return await dbClient.delete(tabelName, where: "$columnID=?", whereArgs: [id]);
  }

}