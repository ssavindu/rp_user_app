class AllBusDestinationsDataModel {
  late List<BusDestiationsDataModel> data;

  AllBusDestinationsDataModel({required this.data});
}

class BusDestiationsDataModel {
  late String destinationLatitude;
  late String destinationLongitude;
  late String destinationName;

  BusDestiationsDataModel(
      {required this.destinationName,
      required this.destinationLatitude,
      required this.destinationLongitude});
}
