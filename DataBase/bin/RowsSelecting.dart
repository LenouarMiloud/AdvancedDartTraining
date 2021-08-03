import 'dart:io';
import 'package:sqljocky5/constants.dart';
import 'package:sqljocky5/sqljocky.dart';
import 'package:sqljocky5/utils.dart';

main(List<String> arguments) async {
	//create a Connection Pool 
  var pool = new ConnectionPool(
    host: 'localhost',
    port: 3306,
    user: 'fsociety',
    password: 'myPass',
    db: 'university',
    max: 10
  );

  //selecting from teachers table
  var results = await pool.query('Select * from teachers');
  //show the number of rows 
  print('Results ${await results.length} rows');
  //close the connection
  pool.closeConnectionsNow();
  exit(0);
}