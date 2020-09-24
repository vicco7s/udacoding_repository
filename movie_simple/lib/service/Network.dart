// import 'dart:convert';



// Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

// String movieToJson(Movie data) => json.encode(data.toJson());

var url = 'http://192.168.43.40/backend_note/getmovie.php';
var ulogin = 'http://192.168.43.40/backend_note/login.php';
var uregis= 'http://192.168.43.40/backend_note/register.php';

class Movie {
    Movie({
        this.tbMovie,
        this.result,
    });

    List<TbMovie> tbMovie;
    int result;

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        tbMovie: List<TbMovie>.from(json["tb_movie"].map((x) => TbMovie.fromJson(x))),
        result: json["result"],
    );

    Map<String, dynamic> toJson() => {
        "tb_movie": List<dynamic>.from(tbMovie.map((x) => x.toJson())),
        "result": result,
    };
}

class TbMovie {
    TbMovie({
        this.id,
        this.title,
        this.country,
        this.duration,
        this.rating,
        this.year,
        this.genre,
        this.detail,
        this.ytube,
    });

    String id;
    String title;
    String country;
    String duration;
    String rating;
    String year;
    List<String> genre;
    String detail;
    String ytube;

    factory TbMovie.fromJson(Map<String, dynamic> json) => TbMovie(
        id: json["id"],
        title: json["title"],
        country: json["country"],
        duration: json["duration"],
        rating: json["rating"],
        year: json["year"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        detail: json["detail"],
        ytube: json["ytube"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "country": country,
        "duration": duration,
        "rating": rating,
        "year": year,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "detail": detail,
        "ytube": ytube,
    };
}