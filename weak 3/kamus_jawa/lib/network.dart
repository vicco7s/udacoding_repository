

final String url = 'http://192.168.43.40/Php/result.php'; //url json
class Profil {
  final String idKamus;
  final String indo, jawa;

  Profil({this.idKamus, this.indo, this.jawa, });

  factory Profil.fromJson(Map<String, dynamic> json) { 
    return Profil(
        idKamus: json["id_kamus"],
        indo: json["indo"],
        jawa: json["jawa"],
  );
  }
}

