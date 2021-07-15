import 'dart:io';

void main(List<String> arguments) {
  //initialise the file in the current path
  String path = Directory.current.path + "/test.txt";
  print('appending to ${path}');

  File file = new File(path);

  Future<RandomAccessFile> future = file.open(mode: FileMode.append);
  future.then((RandomAccessFile randomAccessFile) {
    print('File has been opened !! ');
    
    randomAccessFile.writeString('Hello LENOUAR').then((value){
      print('file has been appended');
    }).catchError(() => print('error occured')).whenComplete(() => randomAccessFile.close());
  });


  print('***** The END');

}
