import 'package:http/http.dart' as https;

main(List<String> args) async{

  var url = Uri.parse('http://httpbin.org/post');
  var response = await https.post(url,body :'name=Miloud&color=red');

  //show the response status
  print('Response status ${response.statusCode}');
  //show the body of our response
  print('Response body ${response.body}');

}