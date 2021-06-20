import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowOnMap extends StatefulWidget {
  double xDirection;
  double yDirection;

  ShowOnMap({this.xDirection, this.yDirection});

  @override
  _ShowOnMapState createState() => _ShowOnMapState();
}

class _ShowOnMapState extends State<ShowOnMap> {
//collection
  var myMarkers = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location on Map"),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.xDirection, widget.yDirection),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            myMarkers.add(Marker(
              markerId: MarkerId("1"),
              position: LatLng(widget.xDirection, widget.yDirection),
            ));
          });
        },
        markers: myMarkers,
      ),
    );
  }
}
