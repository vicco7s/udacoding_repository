import 'package:flutter/cupertino.dart';
import 'package:mahasiswa_app/model/loginmodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';



class DataHapLogin {

  static final DataHapLogin _instanse = DataHapLogin.internal();
  factory DataHapLogin() => _instanse;

  final String tableName = 'users';
  final String columnID = 'id';
  final String columnEmail = 'email';
  final String columnUsername = 'username';
  final String columnPassword = 'password';

  static Database _db;

  DataHapLogin.internal();

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
    db.execute('CREATE TABLE $tableName($columnID INTEGER PRIMARY KEY, $columnEmail TEXT, $columnUsername TEXT, $columnPassword TEXT)');
  }

  //Create data user
  Future<int> createUser(LoginUser loginuser) async{
    var dbClient = await db;
    var result = await dbClient.insert(tableName, loginuser.toMap());
    return result;
  }

  //Get all data user
  Future<List> getAllUsers() async{
    var dbClient = await db;
    var result = await dbClient.query(tableName, columns: [columnID, columnEmail, columnUsername, columnPassword]);
    return result;
  }

  //Get one data user
  Future<LoginUser> getUser({@required String username, @required String password}) async{
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $tableName WHERE $columnUsername = ? AND $columnPassword = ?", [username, password]);
    if(result.length>0){
      return LoginUser.fromMap(result.first);
    }
    return null;
  }

  //Update data user
  Future<int> updateUser(LoginUser loginuser) async{
    var dbClient = await db;
    return await dbClient.update(tableName, loginuser.toMap(), where: "$columnID=?", whereArgs: [loginuser.id]);
  }

  //Delete data user
  Future<int> deleteUser(int id) async{
    var dbClient = await db;
    return await dbClient.delete(tableName, where: "$columnID=?", whereArgs: [id]);
  }

}
