import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:profil_sekolah/models/modelFirebase.dart';

class MapSchool extends StatelessWidget {
  final LatLng location;
  final SchoolModel school;

  MapSchool({this.location, this.school});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(5.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              height: 400,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: location,
                  zoom: 15,
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