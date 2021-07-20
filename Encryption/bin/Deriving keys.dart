import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/export.dart';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> args){
    String password = "Hack The Box";
    var hackString = createUint8listFromString('hacKtheboxnow');
    //the list of algorithm
    var pkcs = new KeyDerivator("SHA-1/HMAC/PBKDF2");

    var params = new Pbkdf2Parameters(hackString, 100, 16);

    pkcs.init(params);

    Uint8List key = pkcs.process(createUint8listFromString(password));

    display("Key Value", key);
}

Uint8List createUint8listFromString(String value) => new Uint8List.fromList(utf8.encode(value));

void display(String title,Uint8List value){
  print(title);
  print(value);
  print(base64.encode(value));
  print('');
}