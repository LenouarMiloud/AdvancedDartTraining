import 'dart:io';

main(List<String> args){

  //run CMD
  Process.run('cmd', ['dir']).then((ProcessResult res){
    print(res.stdout);
    print('Exit code ${res.exitCode}');
  });

}