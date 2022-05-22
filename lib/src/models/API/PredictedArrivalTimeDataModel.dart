class PredictedArrivalTimeDataModel {
  late String currentLongitude;
  late String currentLatitude;
  late String timeDelta;
  late String predictedArrivalTime;

  PredictedArrivalTimeDataModel(
      {required this.currentLatitude,
      required this.currentLongitude,
      required this.predictedArrivalTime,
      required this.timeDelta});

  factory PredictedArrivalTimeDataModel.fromJson(Map<String, dynamic> json) {
    //print(BusDestinationDataModel.fromJson(json));
    PredictedArrivalTimeDataModel obj = PredictedArrivalTimeDataModel(
        currentLatitude: json['currentLatitude'],
        currentLongitude: json['currentLongitude'],
        predictedArrivalTime: json['predictedArrivalTime'],
        timeDelta: json['timeDelta']);

    return obj;
  }
}
