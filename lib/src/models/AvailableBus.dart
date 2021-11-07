
// ignore_for_file: file_names

import 'package:busfinder_user/src/models/Bus.dart';

class AvailableBus extends Bus{
  late String predictedArrivalTime;

  AvailableBus({required String busID, required String routeNumber, required String routeName, required this.predictedArrivalTime}):
  super(busID: busID,routeName: routeName, routeNumber:  routeNumber);
}