import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<String> authTest(String email, String password) async {
  //print('Hello');
  var apiUrl = Uri.parse('http://10.0.2.2:8085/api/user/auth');
  final response = await http.post(
    apiUrl,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
      //'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
        <String, String>{"username": "$email", "password": "$password"}),
  );
  print(response.statusCode);
  return response.body;
  //return response.body;
}

Future<void> getTest() async {
  var apiUrl = Uri.parse('http://10.0.2.2:8085/api/user/test');
  final response = await http.get(apiUrl);
  print(response.statusCode);
  //return response.body;
  print(response.body);
}

Future<void> getTime() async {
  try {
    http.Response response = await http.get(
        Uri.parse('http://worldtimeapi.org/api/timezone/America/New_York'));
    print(response.body);
  } catch (e) {
    print('Caught Error: ${e}');
  }
}
