import 'dart:io';
import 'dart:async';
import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/sqljocky.dart';

main(List<String> arguments) async {

  //Connection Setting
  var pool = new ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'fsociety',
      password: 'myPass',
      db: 'school'
  );
  //the select query
  MySqlConnection conn;
  var results = await conn.execute('select Name, Topic from teachers');
  //show the result of query
  await results.forEach((row) {
    print('Name: ${row[0]}, Topic: ${row[1]}'); //name or index


  });
  //close connection
  conn.close();
  exit(0);
}