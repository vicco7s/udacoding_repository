class ModelMahasiswa{
  int _id;
  String _nim;
  String _nama;
  String _gender;
  String _alamat;
  int _tahun;


  ModelMahasiswa(this._nim, this._nama, this._gender, this._alamat, this._tahun);

  //SETTER  map yang akan di distribusikan 
  ModelMahasiswa.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._nim = map['nim'];
    this._nama = map['nama'];
    this._gender = map['gender'];
    this._alamat = map['alamat'];
    this._tahun = map['tahun'];
  }

  // GETTER  mengembalikan objek map
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_id != null){
      map['id'] = _id;
    }
    map['nim'] = _nim;
    map['nama'] = _nama;
    map['gender'] = _gender;
    map['alamat'] = _alamat;
    map['tahun'] = _tahun;
    return map;
  }

  //GETTER mengambil nilai pada variable
  int get tahun => _tahun;
  String get alamat => _alamat;
  String get gender => _gender;
  String get nama => _nama;
  String get nim => _nim;
  int get id => _id;

}