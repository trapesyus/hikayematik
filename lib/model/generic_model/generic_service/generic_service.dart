import 'package:mysql1/mysql1.dart';

import '../generic_model.dart';

class GenericService {
  Future<List<GenericModel>> getData(String tableName) async {
    final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      db: 'fanus_yazilim',
      password: 'afacan2',
    ));
    await conn.query('SELECT * FROM $tableName');
    final results = await conn.query('SELECT * FROM $tableName');
    conn.close();

    return results.map((row) {
      return GenericModel(
        id: row['id'],
        title: row['title'].toString(),
        content: row['content'].toString(),
      );
    }).toList();
  }
}
