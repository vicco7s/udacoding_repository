import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:profil_sekolah/components/maps.dart';
import 'package:profil_sekolah/models/modelFirebase.dart';
import 'package:profil_sekolah/util/const.dart';

class DetailPage extends StatefulWidget {
  final SchoolModel school;
  DetailPage({this.school});
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: cColorsWhite,
            title: Text(
              "Detail Sekolah",
              style: kAppBarText,
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: cColorsBlue,
              ),
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
          ),
      body: Column(
        children: [
          MapSchool(
              location: LatLng(
                double.parse(widget.school.lat),
                double.parse(widget.school.long),
              ),
              school: widget.school,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
               child: ListTile(
                 leading: Icon(Icons.school,color: cColorsBlue,),
                 title: Text(widget.school.nameSchool,),
               ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
               child: ListTile(
                 leading: Icon(Icons.location_city,color: cColorsBlue,),
                 title: Text(widget.school.description,),
               ), 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 10.0,
               child: ListTile(
                 leading: Icon(Icons.control_point,color: cColorsBlue,),
                 title: Text(widget.school.lat+' - '+widget.school.long),
               ), 
              ),
            )
        ],
      ),
    );
  }
}
