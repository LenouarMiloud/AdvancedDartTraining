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

  

}

//from Deriving Keys program
Uint8List createUint8listFromString(String value) => new Uint8List.fromList(utf8.encode(value));

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