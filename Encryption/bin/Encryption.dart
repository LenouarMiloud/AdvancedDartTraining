import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> arguments) {

  //initialise the Encrypting Algorithm
  Digest digest = new Digest("SHA-256");

  String name = "LENOUAR Miloud";

  Uint8List data = new Uint8List.fromList(utf8.encode(name));

  //Process the data
  Uint8List hash = digest.process(data);

  print(hash);
  print(base64.encode(hash));


}
