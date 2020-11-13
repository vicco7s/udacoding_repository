import 'package:firebase_database/firebase_database.dart';

class SchoolModel {
  final String key;
  String nameSchool;
  String description;
  String lat;
  String long;

  SchoolModel(
      {this.key, this.nameSchool, this.description, this.lat, this.long});

  SchoolModel.fromSnapshot(DataSnapshot snapshot)
      : key = snapshot.key,
        nameSchool = snapshot.value['namaSchool'],
        description = snapshot.value['description'],
        lat = snapshot.value['lat'],
        long = snapshot.value['long'];

  Map<String, dynamic> toJson() => {
    'namaSchool': nameSchool,
    'description': description,
    'lat':lat,
    'long': long,
  };
}
