import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) async {
  var clientSocket = await Socket.connect("127.0.0.1", 3000);

  print('Connected');
  clientSocket.write("Hello Miloud From Client TCP");
  print('Sent, closing');
  await clientSocket.close();
  print('Closed');
  exit(0);
  }