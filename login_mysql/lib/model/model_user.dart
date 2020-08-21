// // To parse this JSON data, do
// //
// //     final welcome = welcomeFromJson(jsonString);

// import 'dart:convert';

// List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

// String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Welcome {
//     Welcome({
//         this.idUser,
//         this.username,
//         this.email,
//         this.fullName,
//         this.gender,
//         this.password,
//         this.alamat,
//         this.tglDaftar,
//     });

//     String idUser;
//     String username;
//     String email;
//     String fullName;
//     String gender;
//     String password;
//     String alamat;
//     String tglDaftar;

//     factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
//         idUser: json["id_user"],
//         username: json["username"],
//         email: json["email"],
//         fullName: json["full_name"],
//         gender: json["gender"],
//         password: json["password"],
//         alamat: json["alamat"],
//         tglDaftar: json["tgl_daftar"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id_user": idUser,
//         "username": username,
//         "email": email,
//         "full_name": fullName,
//         "gender": gender,
//         "password": password,
//         "alamat": alamat,
//         "tgl_daftar": tglDaftar,
//     };
// }
