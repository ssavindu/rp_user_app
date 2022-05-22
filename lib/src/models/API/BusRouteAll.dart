// ignore_for_file: unnecessary_new
import 'dart:convert';

class BusRouteAll {
  late String busRoute;
  late BusDestinationDataModel routeDestination1;
  late BusDestinationDataModel routeDestination2;
  BusRouteAll(
      {required this.busRoute,
      required this.routeDestination1,
      required this.routeDestination2});

  factory BusRouteAll.fromJson(Map<String, dynamic> json) {
    print(json);
    return BusRouteAll(
      busRoute: json['busRoute'],
      routeDestination1: json['routeDestination1'],
      routeDestination2: json['routeDestination2'],
    );
  }
}

class BusRouteAllDataModel {
  List<BusRouteAll> busRouteAll = [];
  BusRouteAllDataModel({required this.busRouteAll});
  factory BusRouteAllDataModel.fromJson(List<dynamic> json) {
    List<BusRouteAll> busRouteData = [];
    json.forEach((element) {
      BusDestinationDataModel routeDestination1 = new BusDestinationDataModel(
          destinationName: element['routeDestination1']['destinationName'],
          destinationLat: element['routeDestination1']['destinationLatitude'],
          destinationLong: element['routeDestination1']
              ['destinationLongitude']);

      BusDestinationDataModel routeDestination2 = new BusDestinationDataModel(
          destinationName: element['routeDestination2']['destinationName'],
          destinationLat: element['routeDestination2']['destinationLatitude'],
          destinationLong: element['routeDestination2']
              ['destinationLongitude']);
      BusRouteAll obj = BusRouteAll(
          busRoute: element['busRoute'],
          routeDestination1: routeDestination1,
          routeDestination2: routeDestination2);

      busRouteData.add(obj);
    });

    return BusRouteAllDataModel(busRouteAll: busRouteData);
  }
}

class BusDestinationDataModel {
  late String destinationName;
  late String destinationLat;
  late String destinationLong;
  BusDestinationDataModel(
      {required this.destinationName,
      required this.destinationLat,
      required this.destinationLong});

  factory BusDestinationDataModel.fromJson(Map<String, dynamic> json) {
    //print(BusDestinationDataModel.fromJson(json));
    return BusDestinationDataModel(
        destinationName: jsonDecode(json['destinationName']),
        destinationLat: jsonDecode(json['destinationLatitude']),
        destinationLong: jsonDecode(json['destinationLongitude']));
  }
}
