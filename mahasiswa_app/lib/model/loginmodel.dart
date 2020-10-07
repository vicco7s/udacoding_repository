class LoginUser{

  int _id;
  String _email;
  String _username;
  String _password;

  LoginUser(this._email, this._username, this._password);

  //set
  LoginUser.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._username = map['username'];
    this._email = map['email'];
    this._password = map['password'];
  }

  // get
  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    if(_id != null){
      map['id'] = _id;
    }
    map['email'] = _email;
    map['username'] = _username;
    map['password'] = _username;
    return map;
  }

  // get
  String get password => _password;
  String get username => _username;
  String get email => _email;
  int get id => _id;


}
