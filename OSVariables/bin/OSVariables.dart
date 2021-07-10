import 'dart:io';

main(List<String> args){
  //show the operating system work on
  print('OS: ${Platform.operatingSystem} ${Platform.version}');

  if(Platform.isWindows){
    print('Hello From Windows');
  }else{
    print('Hello From Anywhere');
  }
  //show the dart location
  print('dart: ${Platform.executable}');
  //show this main file location
  print('path: ${Platform.script.path}');

  //show the envirenment
  print('Envienment');
  Platform.environment.keys.forEach((key) {
    print('${key} ${Platform.environment[key]}');
  });
}