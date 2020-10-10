
import 'package:mahasiswa_app/model/mahasiswaModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataMahasiswaHap {

  static final DataMahasiswaHap _instanse = new DataMahasiswaHap.internal();
  factory DataMahasiswaHap() => _instanse;

  final String tableName = 'mahasiswas';
  final String columnID = 'id';
  final String columnNim = 'nim';
  final String columnNama = 'nama';
  final String columnGender = 'gender';
  final String columnAlamat = 'alamat';
  final String columnTahun = 'tahun';

  static Database _db;

  DataMahasiswaHap.internal();

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'mahasiswas.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    db.execute('CREATE TABLE $tableName($columnID INTEGER PRIMARY KEY, $columnNim TEXT, $columnNama TEXT, $columnGender TEXT, $columnAlamat TEXT, $columnTahun INTEGER)');
  }

  //Create data mahasiswa
  Future<int> createMahasiswa(ModelMahasiswa modelmahasiswa) async{
    var dbClient = await db;
    var result = await dbClient.insert(tableName, modelmahasiswa.toMap());
    return result;
  }

  //Get all data mahasiswa
  Future<List> getAllMahasiswa() async{
    var dbClient = await db;
    var result = await dbClient.query(tableName, columns: [columnID, columnNim, columnNama, columnGender, columnAlamat, columnTahun]);
    return result;
  }

  //Update data mahasiswa
  Future<int> updateMahasiswa(ModelMahasiswa modelmahasiswa) async{
    var dbClient = await db;
    return await dbClient.update(tableName, modelmahasiswa.toMap(), where: "$columnID=?", whereArgs: [modelmahasiswa.id]);
  }

  //Delete data mahasiswa
  Future<int> deleteMahasiswa(int id) async{
    var dbClient = await db;
    return await dbClient.delete(tableName, where: "$columnID=?", whereArgs: [id]);
  }

}