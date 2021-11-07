// ignore_for_file: file_names

import 'package:busfinder_user/src/models/AvailableBus.dart';
import 'package:flutter/material.dart';

class AvailableBusListPage extends StatefulWidget {
  const AvailableBusListPage({ Key? key }) : super(key: key);

  @override
  _AvailableBusListPageState createState() => _AvailableBusListPageState();
}

class _AvailableBusListPageState extends State<AvailableBusListPage> {

  late AvailableBus selectedBus ;

  late String dropdownValue ;
  bool defaultChanged = false;

  // define avilable bus list here
  // use AvailableBus model 
  List <AvailableBus> availableBusList =[
    AvailableBus(busID: '1', routeName: 'Padukka/ Pettah', routeNumber: '125', predictedArrivalTime: '10:50'),
    AvailableBus(busID: '10', routeName: 'Ingiriya/ Pettah', routeNumber: '125', predictedArrivalTime: '11:00'),
    AvailableBus(busID: '70', routeName: 'Padukka/ Pettah', routeNumber: '125', predictedArrivalTime: '11:15'),
    AvailableBus(busID: '32', routeName: 'Ingiriya/ Pettah', routeNumber: '125', predictedArrivalTime: '11:30'),
    AvailableBus(busID: '5', routeName: 'Padukka/ Pettah', routeNumber: '125', predictedArrivalTime: '11:40'),
    AvailableBus(busID: '15', routeName: 'Padukka/ Pettah', routeNumber: '125', predictedArrivalTime: '12:00'),
    AvailableBus(busID: '12', routeName: 'Ingiriya/ Pettah', routeNumber: '125', predictedArrivalTime: '12:10'),
    AvailableBus(busID: '96', routeName: 'Padukka/ Pettah', routeNumber: '125', predictedArrivalTime: '12:20'),
    AvailableBus(busID: '11', routeName: 'Ingiriya/ Pettah', routeNumber: '125', predictedArrivalTime: '12:30'),
    AvailableBus(busID: '5', routeName: 'Padukka/ Pettah', routeNumber: '125', predictedArrivalTime: '12:40'),
  ];

    
  @override
  Widget build(BuildContext context) {

    // Assign default value unless user selects a new bus
    if(!defaultChanged){
      //  gets the fist bus of the available bus list as the default value of the selected bus
      dropdownValue = '${availableBusList.first.routeNumber} - ${availableBusList.first.routeName} - ${availableBusList.first.predictedArrivalTime}';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick Your Bus"),
        centerTitle: true,
      ),
      body: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 40),
                  const Text(
                    "Next available buses for your destination",
                    style: TextStyle(
                      fontSize: 17
                    ),
                  ),
                
                  const SizedBox(height: 10),
          
                  DropdownButton(
                    value:dropdownValue,
                    hint: const Text("Select you bus"),
                    isExpanded: false,
                    icon: const Icon(Icons.arrow_drop_down),
                  
                    items: availableBusList.map((availableBus){
                      return DropdownMenuItem(
                        value: '${availableBus.routeNumber} - ${availableBus.routeName} - ${availableBus.predictedArrivalTime}', // assign value to get after change the selected field
                        child: Text('${availableBus.routeNumber} - ${availableBus.routeName} - ${availableBus.predictedArrivalTime}'), // set value to display
                      );
                    }).toList(),
          
                    onChanged: (String? newBus){
                      setState(() {
                        defaultChanged = true; // initial state chaged after select differnt bus
                        dropdownValue = newBus!; // assign selected bus to dropdown value
          
                        //  print("DropdownValue "+dropdownValue);
                        
                      });
                    },
                    style: const TextStyle(
                      color: Colors.greenAccent,
                      fontSize: 18,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.greenAccent[400],
                    ),
                  ),
          
                  const SizedBox(height: 100),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
    
                      width: 120,
                      child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                              print("Selected bus: $dropdownValue");
                            // use dropdownValue to futher process
                            // use routes to pass data
                            // choose suitable data to pass to next screen
                              
                          });
                        },

                        child: const Text(
                          "Track",
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                          foregroundColor: MaterialStateProperty.all(Colors.black)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}