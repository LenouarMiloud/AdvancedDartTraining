import 'package:http/http.dart' as http;
import 'dart:async';

main(List<String> arguments) async {
  var myurl = 'http://httpbin.org/';
  var response = await http.get(myurl);
  //show the response status
  print('Response status ${response.statusCode}');
  //show the body of our response
  print('Response body ${response.body}');
}