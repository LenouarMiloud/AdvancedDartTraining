import 'package:pointycastle/pointycastle.dart';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:math';

main(List<String> arguments) {

  print('how many random number you want to generate');
  int randomNumber = int.parse(stdin.readLineSync());
  
  print('Your Random Numbers are :');
  print(randomBytes(randomNumber));

}

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