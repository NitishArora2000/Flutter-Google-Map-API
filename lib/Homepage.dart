import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  LatLng _initialposition = LatLng(37.42, -122.085);
  GoogleMapController _controller;
  Location _location = Location();

  void _onmapcreated(GoogleMapController _cntrl) {
    _controller = _cntrl;
    _location.onLocationChanged.listen((event) {
      _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(event.latitude, event.longitude),
        zoom: 15,
      )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition:
                CameraPosition(target: _initialposition, zoom: 10),
            mapType: MapType.normal,
            onMapCreated: _onmapcreated,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
          )
        ],
      ),
    );
  }
}
