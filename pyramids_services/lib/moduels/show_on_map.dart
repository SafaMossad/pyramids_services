import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowOnMap extends StatefulWidget {
  @override
  _ShowOnMapState createState() => _ShowOnMapState();
}

class _ShowOnMapState extends State<ShowOnMap> {
/*  //Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);*/
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
          target: LatLng(29.9792391, 31.1320132),
          zoom: 14.4746,
        ),
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            myMarkers.add(Marker(
              markerId: MarkerId("1"),
              position: LatLng(29.9792391, 31.1320132),
            ));
          });
        },
        markers: myMarkers,
      ),
    );
  }
}
