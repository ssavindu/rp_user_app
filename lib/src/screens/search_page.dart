import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final _placesController = TextEditingController();
    var deviceWidth = MediaQuery.of(context).size.width;

    @override
    void dispose() {
      _placesController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Buses'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
            child: Column(
              children:  [
                const SizedBox(height: 40,),
                Form(
                  key: _formKey,
                  child: SizedBox(
                    width: deviceWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: deviceWidth,
                          child: const Text(
                            'Your Pickup Location',
                            textAlign: TextAlign.left,
                            textWidthBasis: TextWidthBasis.parent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Current GPS Location',
                            labelStyle: TextStyle(fontSize: 20),
                            filled: true,
                          ),
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Please set GPS Location';
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
                        SizedBox(
                          width: deviceWidth,
                          child: const Text(
                            'Search Your Destination',
                            textAlign: TextAlign.left,
                            textWidthBasis: TextWidthBasis.parent,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller:  _placesController,
                          onTap: () async {
                            // placeholder for  places search later
                          },
                          decoration: const InputDecoration(
                            labelText: 'Destination',
                            labelStyle: TextStyle(fontSize: 20),
                            filled: true,
                          ),

                          validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Please enter destination';
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 16.0)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 20),
                              primary: Colors.green[800]
                          ),
                          onPressed: (){
                            if (_formKey.currentState!.validate()){
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Searching')),
                              );
                            }
                          },
                          child: const Text('Search'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
