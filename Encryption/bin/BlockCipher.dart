import 'dart:io';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';

//work with AES
void main(List<String> args){

  final key = randomBytes(16);
  final params = new KeyParameter(key);

  BlockCipher blockCipher = new BlockCipher("AES");
  blockCipher.init(true, params);
  String miloudText = "Hello Miloud";

  //Encryption
  Uint8List miloudTextData = createUint8listFromString(miloudText.padRight(blockCipher.blockSize));

  Uint8List miloudTextEncrypted = blockCipher.process(miloudTextData);

  //Decryption
  blockCipher.reset();
  blockCipher.init(false, params);
  Uint8List miloudTextDecrypted = blockCipher.process(miloudTextEncrypted);

  //view the result
  display("Original Text", miloudTextData);
  display("Text Encrypted", miloudTextEncrypted);
  display("Text Decrypted", miloudTextDecrypted);

  //Test Function
  Function testFunction = const ListEquality().equals;
  assert(testFunction(miloudTextData,miloudTextDecrypted));

  print(utf8.decode(miloudTextDecrypted));

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
