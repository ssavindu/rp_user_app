// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:busfinder_user/src/models/API/BusRouteAll.dart';

class BusDetailsDataModel {
  late BusRouteAll busRouteDetails;
  late String owner;
  late String vehicleNumber;

  BusDetailsDataModel(
      {required this.busRouteDetails,
      required this.owner,
      required this.vehicleNumber});

  factory BusDetailsDataModel.fromJson(Map<String, dynamic> json) {
    BusDestinationDataModel routeDestination1 = new BusDestinationDataModel(
        destinationName: json['busRouteDetails']['routeDestination1']
            ['destinationName'],
        destinationLat: json['busRouteDetails']['routeDestination1']
            ['destinationLatitude'],
        destinationLong: json['busRouteDetails']['routeDestination1']
            ['destinationLongitude']);

    BusDestinationDataModel routeDestination2 = new BusDestinationDataModel(
        destinationName: json['busRouteDetails']['routeDestination2']
            ['destinationName'],
        destinationLat: json['busRouteDetails']['routeDestination2']
            ['destinationLatitude'],
        destinationLong: json['busRouteDetails']['routeDestination2']
            ['destinationLongitude']);

    print(json['busRouteDetails']['routeDestination1']);
    return BusDetailsDataModel(
      busRouteDetails: new BusRouteAll(
        busRoute: json['busRouteDetails']['busRoute'],
        routeDestination1: routeDestination1,
        routeDestination2: routeDestination2,
      ),
      //BusRouteAll.fromJson(jsonDecode(json['busRouteDetails'])),
      owner: json['owner'],
      vehicleNumber: json['vehicleNumber'],
    );
  }
}
