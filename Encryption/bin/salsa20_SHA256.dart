import 'dart:convert';
import 'dart:typed_data';
import 'dart:math';
import 'package:collection/collection.dart';
import 'package:pointycastle/pointycastle.dart';

main(List<String> arguments) {
  final keyBytes = randomBytes(16);
  final key = new KeyParameter(keyBytes);
  final iv = randomBytes(8);
  final params = new ParametersWithIV(key, iv);

  StreamCipher streamCipher = new StreamCipher("Salsa20");
  streamCipher.init(true, params);

  //Encryption
  Uint8List plainData = createUint8listFromString("Hello Miloud");
  Uint8List dataEncrypted = streamCipher.process(plainData);

  //Decryption
  streamCipher.reset();
  streamCipher.init(false, params);
  Uint8List dataDecrypted = streamCipher.process(dataEncrypted);

  //view the result
  display("Original Text", plainData);
  display("Text Encrypted", dataEncrypted);
  display("Text Decrypted", dataDecrypted);

  Digest digest = new Digest("SHA-256");
  
  assert(base64.encode(digest.process(plainData)) == base64.encode(digest.process(dataDecrypted)));

  print("we code with Salsa20 and decode with SHA-256 with success");


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