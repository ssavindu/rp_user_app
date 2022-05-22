// ignore_for_file: dead_code

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:busfinder_user/src/models/API/AvailableBusList.dart';
import 'package:busfinder_user/src/models/API/BusDetailsDataModel.dart';
import 'package:busfinder_user/src/models/API/BusRouteAll.dart';
import 'package:busfinder_user/src/models/API/PredictedArrivalTimeDataModel.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://144.24.149.124:8070/logging-api';

Future<String> getEstTime() async {
  //print('Hello');
  var apiUrl =
      Uri.parse('http://129.154.36.176:5000/prediction/getArrivalTime');
  final response = await http.post(
    apiUrl,
    headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'},
    body: jsonEncode({
      "startLongitude": 80.6242,
      "startLatitude": 7.52145,
      "endLongitude": 80.6227,
      "endLatitude": 7.50064,
      "isRushHour": "True",
      "isWeekEnd": "False",
      "isPublicHoliday": "False",
      "busID": 1225
    }),
  );
  print(response.statusCode);
  return response.body;
  //return response.body;
}

Future<String> getEstTimeAtoB(String pickup, String destination) async {
  //print('Hello');

  double startLon, startLat, endLon, endLat;

  List<String> pickupLine = pickup.split("-");
  startLon = double.parse(pickupLine[1]);
  startLat = double.parse(pickupLine[2]);

  List<String> destLine = destination.split("-");
  endLon = double.parse(destLine[1]);
  endLat = double.parse(destLine[2]);

  var apiUrl =
      Uri.parse('http://129.154.36.176:5000/prediction/getArrivalTime');
  final response = await http.post(
    apiUrl,
    headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'},
    body: jsonEncode({
      "startLongitude": startLon,
      "startLatitude": startLat,
      "endLongitude": endLon,
      "endLatitude": endLat,
      "isRushHour": "True",
      "isWeekEnd": "False",
      "isPublicHoliday": "False",
      "busID": 1225
    }),
  );
  print(response.statusCode);
  return response.body;
  //return response.body;
}

Future<BusRouteAllDataModel> getAllRoutes() async {
  var apiUrl = Uri.parse(baseUrl + '/bus-routes/getAll');
  final response = await http.get(apiUrl);
  List<BusRouteAll> allRoutes(String str) => List<BusRouteAll>.from(
      json.decode(str).map((x) => BusRouteAll.fromJson(x)));

//http.Response res = http.Response(response, 200);
  if (response.statusCode == 200) {
    var busRoutes = jsonDecode(response.body);
    return BusRouteAllDataModel.fromJson(busRoutes['data']);
    //return allRoutes(busRoutes['data'].toString());
  } else {
    throw Exception('Failed to load album');
  }
  // if (response.statusCode == 200) {
  //return BusRouteAllDataModel.fromJson(jsonDecode(response.body));
  // } else {
  //   // If the server did not return a 200 OK response,
  //   // then throw an exception.
  //   throw Exception('Failed to load album');
  // }
}

Future<BusDetailsDataModel> getBusDetails(String vehicleNumber) async {
  var apiUrl =
      Uri.parse(baseUrl + '/bus-details/getBusDetails/' + vehicleNumber);
  final response = await http.get(apiUrl);
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    BusDetailsDataModel bus = BusDetailsDataModel.fromJson(jsonResponse);
    return bus;
  } else {
    throw Exception(response.body);
  }
}

Future<AvailableBusDetailsDataModel> getAvailableBusDetails(String routeNumber,
    String destination, String userCurrentLong, String userCurrentLat) async {
  var apiUrl = Uri.parse(baseUrl +
      '/bus-location/getAvailableBusList/' +
      routeNumber +
      '/' +
      destination +
      '/' +
      userCurrentLong +
      '/' +
      userCurrentLat);
  final response = await http.get(apiUrl);
  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    AvailableBusDetailsDataModel busList =
        AvailableBusDetailsDataModel.fromJson(jsonResponse['data']);

    print(jsonResponse);
    return busList;
  } else {
    throw Exception(response.body);
  }
}

Future<PredictedArrivalTimeDataModel> getPredictionTimeWithLocation() async {
  //Send selected bus details as follow
//   {
//   "vehicleNumber": "NB-5587",
//   "isPublicHoliday": false,
//   "isWeekEnd": false,
//   "isRushHour": true,
//   "endLatitude": "7.492985",
//   "endLongitude": "80.623503",
//   "timestamp": "2022-05-20 20:25:41.020106"
// }

//   {
//   "currentLongitude": "80.6241928",
//   "currentLatitude": "7.5214472",
//   "timeDelta": "340.7772",
//   "predictedArrivalTime": "2022-05-20 20:31:21.797306"
// }
  var apiUrl =
      Uri.parse('http://129.154.36.176:5000/prediction/getArrivalTime');
  final response = await http.post(
    apiUrl,
    headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'},
    body: jsonEncode({
      "vehicleNumber": "NB-5587",
      "isPublicHoliday": false,
      "isWeekEnd": false,
      "isRushHour": true,
      "endLatitude": "7.492985",
      "endLongitude": "80.623503",
      "timestamp": "2022-05-20 20:25:41.020106"
    }),
  );
  if (response.statusCode == 201) {
    final jsonResponse = json.decode(response.body);
    PredictedArrivalTimeDataModel obj =
        PredictedArrivalTimeDataModel.fromJson(jsonResponse);

    print(jsonResponse);
    return obj;
  } else {
    throw Exception(response.body);
  }
}
