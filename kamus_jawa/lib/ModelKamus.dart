// // To parse this JSON data, do
// //
// //     final profil = profilFromJson(jsonString);

// import 'dart:convert';

// List<Profil> profilFromJson(String str) => List<Profil>.from(json.decode(str).map((x) => Profil.fromJson(x)));

// String profilToJson(List<Profil> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Profil {
//     Profil({
//         this.idKamus,
//         this.indo,
//         this.jawa,
//     });

//     String idKamus;
//     String indo;
//     String jawa;

//     factory Profil.fromJson(Map<String, dynamic> json) => Profil(
//         idKamus: json["id_kamus"],
//         indo: json["indo"],
//         jawa: json["jawa"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id_kamus": idKamus,
//         "indo": indo,
//         "jawa": jawa,
//     };
// }
