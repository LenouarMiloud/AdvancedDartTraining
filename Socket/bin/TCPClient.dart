import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) async {
  var serverSocket = await ServerSocket.bind("127.0.0.1", 3000);

  print('Connected');
  socket.write("Hello Miloud From Client TCP");
  print('Sent, closing');
  await socket.close();
  print('Closed');
  exit(0);