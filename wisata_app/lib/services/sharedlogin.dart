import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService{

  Future<bool> isLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    bool isLogin = pref.getBool('isLogin') ?? false;

    return isLogin;
  }

  Future<void> removeLoginData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove('isLogin');
  }

  Future<String> savedDataPref({datetype, key, value}) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    switch(datetype){
      case "bool" :
        pref.setBool(key, value);
        break;
      case "int" :
        pref.setInt(key, value);
        break;
      case "double" :
        pref.setDouble(key, value);
        break;
      case "string" :
        pref.setString(key, value);
        break;
      default :
        return "Data Invalid Now";
        break;
    }

    var result = "accept data for $datetype with key $key and value $value";
    return result;

  }

}