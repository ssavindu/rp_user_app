// ignore_for_file: unnecessary_new

import 'dart:convert';

import 'package:busfinder_user/src/models/API/DestinationCoordinatesDataModel.dart';

class BusDetailDataModel {
  late LocationCoordinates busLocation;
  late String vehicleNumber;
  BusDetailDataModel({required this.busLocation, required this.vehicleNumber});

  factory BusDetailDataModel.fromJson(Map<String, dynamic> json) {
    //print(BusDestinationDataModel.fromJson(json));
    return BusDetailDataModel(
        busLocation: jsonDecode(json['busLocation']),
        vehicleNumber: jsonDecode(json['vehicleNumber']));
  }
}

class AvailableBusDetailsDataModel {
  late List<BusDetailDataModel> data;
  AvailableBusDetailsDataModel({required this.data});

  factory AvailableBusDetailsDataModel.fromJson(List<dynamic> json) {
    //print(BusDestinationDataModel.fromJson(json));

    List<BusDetailDataModel> busDetailsData = [];
    json.forEach((element) {
      LocationCoordinates location = new LocationCoordinates(
          latitude: element['busLocation']['latitude'],
          longitude: element['busLocation']['longitude']);
      BusDetailDataModel obj = BusDetailDataModel(
          busLocation: location, vehicleNumber: element['vehicleNumber']);

      busDetailsData.add(obj);
    });

    return AvailableBusDetailsDataModel(data: busDetailsData);
  }
}
