

final String url = "http://192.168.43.40:8000/Php/result.php";

class Welcome {
    Welcome({
        this.idUser,
        this.username,
        this.email,
        this.fullName,
        this.gender,
        this.password,
        this.alamat,
        this.tglDaftar,
    });

    String idUser;
    String username;
    String email;
    String fullName;
    String gender;
    String password;
    String alamat;
    String tglDaftar;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        idUser: json["id_user"],
        username: json["username"],
        email: json["email"],
        fullName: json["full_name"],
        gender: json["gender"],
        password: json["password"],
        alamat: json["alamat"],
        tglDaftar: json["tgl_daftar"],
    );}