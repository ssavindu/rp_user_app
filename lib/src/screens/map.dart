// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(6.933167, 80.187966), zoom: 14);

  static final _locationMarkerA = Marker(
      markerId: MarkerId('locationA'),
      infoWindow: InfoWindow(title: 'From'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(6.933167, 80.187966));

  static final _locationMarkerB = Marker(
      markerId: MarkerId('locationB'),
      infoWindow: InfoWindow(title: 'To'),
      icon: BitmapDescriptor.defaultMarker,
      position: LatLng(6.936566, 80.193660));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: {_locationMarkerA, _locationMarkerB},
        myLocationButtonEnabled: false,
        zoomControlsEnabled: true,
        initialCameraPosition: _initialCameraPosition,
      ),
    );
  }
}
