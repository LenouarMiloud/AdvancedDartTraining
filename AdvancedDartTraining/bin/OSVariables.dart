import 'dart:io';

void main(List<String> arguments) {
  print('OS ${Platform.operatingSystem} ${Platform.version}');

  if(Platform.isWindows){
    print('run the code in Windows');
  }else{
    print('normal run');
  }
  print('Dart: ${Platform.executable}');
}
