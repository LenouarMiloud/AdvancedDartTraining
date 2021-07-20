import 'dart:typed_data';
import 'dart:convert';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> args){
    String password = "Hack The Box";
}

Uint8List CreateUint8listFromString(String value) => new Uint8List.fromList(utf8.encode(value));

void display(String title,Uint8List value){
  
}