import 'dart:async';
import 'package:mysql1/mysql1.dart';

Future main(List<String> arguments) async {
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      db: 'myDataBase',
      password: ''));

  // create our table
  await conn.query(
      'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');
}
