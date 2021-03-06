import 'dart:io';
import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/sqljocky.dart';

main(List<String> arguments) async {
  //create a Connection Pool
  var pool = new ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'fsociety',
      password: 'myPass',
      db: 'university'
  );

  //selecting from teachers table
  MySqlConnection conn;
  var results = await conn.execute('Select * from teachers');
  //show the number of rows
  print('Results ${await results.length} rows');
  //close the connection
  conn.close();
  exit(0);
}