import 'dart:io';
import 'dart:convert';

main (List<String> args){

  var myData = 'Hello Miloud';

  List<int> dataToSend = utf8.encode(myData);
  int port = 3000;

  //MyServer
  RawDatagramSocket.bind(InternetAddress.LOOPBACK_IP_V4, port).then((RawDatagramSocket myUDPSocket){
    myUDPSocket.listen((RawSocketEvent rawSocketEvent) {
      if(rawSocketEvent == RawSocketEvent.READ){
        Datagram datagram = myUDPSocket.receive();
        print(utf8.decode(datagram.data));
      }
    });
  //MyClient
  myUDPSocket.send(dataToSend, InternetAddress.LOOPBACK_IP_V4, port);
  print('Sent with success !!');


  });

}