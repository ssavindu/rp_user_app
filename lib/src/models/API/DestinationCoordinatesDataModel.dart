class DestinationCoordinatesDataModel {
  late LocationCoordinates destinationGeoCoordinates;

  DestinationCoordinatesDataModel({required this.destinationGeoCoordinates});
}

class LocationCoordinates {
  late String latitude;
  late String longitude;

  LocationCoordinates({required this.latitude, required this.longitude});
}
