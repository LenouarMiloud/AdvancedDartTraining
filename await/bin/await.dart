import 'dart:async';
import 'dart:io';

void main(List<String> arguments) async {
  print('Starting');

  //await to assign Future to File Object 
  File file = await appendFile();
  
  print('file appended to ${file.path}');

  print('****** END');
}

Future<File> appendFile(){
  File file = new File(Directory.current.path + '/test.txt');
  DateTime dateTime = new DateTime.now();
  return file.writeAsString(dateTime.toString() + '\r\n',mode: FileMode.append);
}
