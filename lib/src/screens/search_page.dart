// ignore_for_file: prefer_const_constructors

import 'package:busfinder_user/src/models/API/PredictedArrivalTimeDataModel.dart';
import 'package:busfinder_user/src/services/time_service.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String DropDownDestination = 'A-80.624223-7.517836';
  String DropDownPickup = 'Colombo-Avissawella';
  String PredictedTime = '';
  bool isSwitched = false;

  //values for toggle switch
  String destinationA = '';
  String destinationB = '';

  var pinPoints = [
    'A-80.624223-7.517836',
    'B-80.622946-7.513576',
    'C-80.6231267-7.4979252',
    'D-80.623716-7.489407',
    'E-80.6235186-7.4767311',
    'F-80.6231026-7.4658412'
  ];

  var sampleRoutes = [
    'Colombo-Avissawella',
    'Avissawella-Hanwella',
    'Padukka-Colombo',
    'Meegoda-Colombo'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Buses'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(90, 20, 30, 20),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text(
                'Select your bus route',
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: DropDownPickup,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.green),
                underline: Container(
                  height: 2,
                  color: Colors.green[800],
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    DropDownPickup = newValue!;

                    var items = DropDownPickup.split('-');
                    destinationA = items[0];
                    destinationB = items[1];
                  });
                },
                items:
                    sampleRoutes.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(destinationA),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                        print(isSwitched);
                      });
                    },
                    activeTrackColor: Colors.grey,
                    activeColor: Colors.green,
                    inactiveThumbColor: Colors.green,
                    inactiveTrackColor: Colors.grey,
                  ),
                  Text(destinationB)
                ],
              ),
              SizedBox(
                height: 100,
              ),
              ButtonTheme(
                height: 50,
                disabledColor: Colors.blueAccent,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Colors.green[800]),
                  onPressed: () async {
                    getAvailableBusDetails(
                        '589',
                        'Kirigalpoththa, Palapathwela',
                        '80.6235856',
                        '7.4907877');
                    setState(() {
                      //PredictedTime = generateTimeFromSeconds(res);
                    });
                  },
                  child: Text(
                    'Get Available Busses List',
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                PredictedTime,
                textAlign: TextAlign.left,
                textWidthBasis: TextWidthBasis.parent,
              ),
              SizedBox(
                height: 50,
              ),
              ButtonTheme(
                height: 50,
                disabledColor: Colors.blueAccent,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Colors.green[800]),
                  onPressed: () async {
                    //Navigator.pushNamed(context, '/map');
                    //await getBusDetails('NA-3958');
                    var test = await getAllRoutes();
                    print(test.busRouteAll[0].busRoute);
                  },
                  child: Text(
                    'View Map',
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              ButtonTheme(
                height: 50,
                disabledColor: Colors.blueAccent,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                      primary: Colors.green[800]),
                  onPressed: () async {
                    PredictedArrivalTimeDataModel res =
                        await getPredictionTimeWithLocation();
                    print(res.predictedArrivalTime);
                    print(res.currentLatitude);
                  },
                  child: Text(
                    'Get Predicted Time',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String generateTimeFromSeconds(String timeSeconds) {
    print(timeSeconds);
    //develop to give minutes and seconds from seconds

    return timeSeconds;
  }

  void loadBusRoutes() {
    //loads all bus routes to the drop down
  }
}
