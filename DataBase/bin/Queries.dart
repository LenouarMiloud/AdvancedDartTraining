import 'dart:io';
import 'dart:async';
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

  //prepare the insert query
  var query = await pool.prepare('insert into teachers (name,topic) values (?,?)');
  await insert(query,'Bob', 'Science');
  await insert(query, 'Mary', 'Shop');

}

  //function of insert 
void insert(var query, String name, String topic) async {
  var result = await query.execute([name,topic]);
  print('New user id = ${result.insertId}');
}