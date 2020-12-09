import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
      // appBar: AppBar(
      //   automaticallyImplyLeading: true,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   backgroundColor: cColorsWhite,
      //   title: Text(
      //     "${widget.school.nameSchool}",
      //     style: kAppBarText,
      //   ),
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: cColorsBlue,
      //     ),
      //     onPressed: () {
      //       Navigator.of(context).pop(context);
      //     },
      //   ),
      // ),
      body: Column(
        children: [
          MapSchool(
            location: LatLng(
              double.parse(widget.school.lat),
              double.parse(widget.school.long),
            ),
            school: widget.school,
          ),
        ],
      ),
    );
  }
}

class MapSchool extends StatelessWidget {
  final LatLng location;
  final SchoolModel school;

  MapSchool({this.location, this.school});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: location,
                  zoom: 20,
                ),
                markers: <Marker>[
                  Marker(
                      markerId: MarkerId(school.nameSchool),
                      position: location,
                      infoWindow: InfoWindow(title: school.nameSchool))
                ].toSet(),
                gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>[
                  Factory<OneSequenceGestureRecognizer>(
                      () => ScaleGestureRecognizer()),
                ].toSet(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
