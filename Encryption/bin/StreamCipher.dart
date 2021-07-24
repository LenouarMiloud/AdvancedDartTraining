import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';

void main(List<String> args){

  final bytesKey = randomBytes(16);
  final key = new KeyParameter(bytesKey);
  final initializeVector = randomBytes(8);
  final params = new ParametersWithIV(key, initializeVector);

  StreamCipher streamCipher = new StreamCipher('Salsa20');
  streamCipher.init(true, params);

  //Encryption
  String miloudText = 'Hello LENOUAR Miloud';
  Uint8List dataMiloudText = createUint8listFromString(miloudText);
  Uint8List encrypteMiloudText = streamCipher.process(dataMiloudText);

  //Decryption
  streamCipher.reset();
  streamCipher.init(false, params);
  Uint8List decrypteMiloudText = streamCipher.process(encrypteMiloudText);
  
  //view the result
  display("Original Text", dataMiloudText);
  display("Text Encrypted", encrypteMiloudText);
  display("Text Decrypted", decrypteMiloudText);

  //test function
  Function testFunction = const ListEquality().equals;
  assert(testFunction(dataMiloudText,decrypteMiloudText));

  print(utf8.decode(decrypteMiloudText));



}

//from Deriving Keys program
Uint8List createUint8listFromString(String value) => new Uint8List.fromList(utf8.encode(value));

//from Deriving Keys program
void display(String title,Uint8List value){
  print(title);
  print(value);
  print(base64.encode(value));
  print('');
}

//from SecureRandomNumber progrm
Uint8List randomBytes(int length) {
  final randomAlg = new SecureRandom("AES/CTR/AUTO-SEED-PRNG");

  final key = new Uint8List(16);
  final keyParam = new KeyParameter(key);
  final params = new ParametersWithIV(keyParam,key);

  randomAlg.seed(params);

  var random = new Random();
  for(int i = 0; i < random.nextInt(255); i++) {
    randomAlg.nextUint8();
  }

  var bytes = randomAlg.nextBytes(length);
  return bytes;
}
